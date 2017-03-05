import json
import psqlparse

def hello():
    print "hello"

def prettify(statements):
    t = type(statements)
    if t == type([]):
        output = []
        for s in statements:
            keys = s.keys()
            for k in keys:
                if k == 'String':
                    output.append('string')
                else:#output.append(parse_statement(k, s[k]))
                    output.append(prettify_statement(k, s[k]))
        return output
    elif t == type([]):
        output = {}
        keys = statements.keys()
        for key in keys:
            output[key] = prettify(statements[key])
        return output
    else:
        return statements

def get_str(str):
    return str['String']['str']

def get_def_elem(elem):
    ret = {
        'name': elem['DefElem']['defname']
    }
    if type(elem['DefElem']['arg']) == type({}):
        ret['arg'] = get_str(elem['DefElem']['arg'])
    elif type(elem['DefElem']['arg']) == type([]):
        ret['arg'] = get_str(elem['DefElem']['arg'][0])
    return ret

def get_type(t):
    if len(t['TypeName']['names']) == 2:
        return get_str(t['TypeName']['names'][1])
    else:
        return get_str(t['TypeName']['names'][0])
    return {
        'type': get_str(t['TypeName']['names'][0]),
        'location': t['TypeName']['location']
    }

def get_function_parameter(parameter):
    p = parameter['FunctionParameter']
    arg_type = get_type(p['argType'])
    return {
        'name': p['name'],
        'direction': 'out' if p['mode'] == 111 else 'in',
        'type': arg_type
    }

def get_plpgsql(names, parameters, definition):
    print 'PLPGSQL', names, parameters

def variable_set(key, statement):
    kind = statement['kind']
    name = statement['name']
    args = statement['args']
    output_args = []
    for arg in args:
        for k in arg.keys():
            if k == 'A_Const':
                output_args.append({
                    'val': get_str(arg[k]['val']),
                    'location': arg[k]['location']
                })
    return {
        'type': 'variable_set',
        'name': name,
        'args': output_args
    }

def create_function(key, statement):
    func_names = []
    parameters = []
    for name in statement['funcname']:
        func_names.append(get_str(name))

    for parameter in statement['parameters']:
        parameters.append(get_function_parameter(parameter))

    returnType = statement['returnType']
    return_names = []
    options = statement['options']
    language = None
    def_as = None
    for option in options:
        for k in option.keys():
            if k == 'DefElem':
                de = get_def_elem(option)
                if de['name'] == 'language':
                    language = de['arg']
                elif de['name'] == 'as':
                    def_as = de['arg']

    body = None
    if language == 'plpgsql':
        get_plpgsql(func_names, parameters, def_as)

    for name in returnType['TypeName']['names']:
        return_names.append(get_str(name))
    return_type = {
        'names': return_names
    }

    #print json.dumps(statement, indent=2)
    return {
        'type': 'create_function',
        'names': func_names,
        'body': body,
        'language': language,
        'parameters': parameters,
        'return_type': return_type
    }

def prettify_statement(key, statement):
    functions = {
        #'VariableSetStmt': variable_set,
        'CreateFunctionStmt': create_function
    }
    if key in functions.keys():
        return functions[key](key, statement)
    else:
        return 'NotFound' + key
