import psqlparse
import pprint
import json

output = {}
sql = open('create_function.sql', 'r').read()
statements = psqlparse.parse(sql)

def get_str(str):
    return str['String']['str']

def parse_statement(t, statement):
    if t == 'CreateFunctionStmt':
        def_as = None
        def_language = None
        names = statement['returnType']['TypeName']['names']
        function_name = get_str(statement['funcname'][0])
        for option in statement['options']:
            defelem = option['DefElem']
            if defelem['defname'] == 'as':
                def_as = get_str(defelem['arg'][0])
            if defelem['defname'] == 'language':
                def_language = get_str(defelem['arg'])
        index = 0
        return_catalog = None
        if len(names) == 2:
            return_catalog = names[0]['String']['str']
            index = 1
        return_type = names[index]['String']['str']

        if def_language == 'plpgsql':
            parsed = psqlparse.parse_plpgsql('CREATE OR REPLACE FUNCTION cs_fmt_browser_version(v_name varchar, v_version varchar) RETURNS void AS $$ ' + def_as + ' $$');
            print json.dumps(parsed, indent=2)
        return {
            'type': t,
            'function_name': function_name,
            'return_catalog': return_catalog,
            'return_type': return_type,
            'language': def_language,
            'as': def_as
        }
    return statement

def prettify(statements):
    t = type(statements)

    if t == type([]):
        output = []
        for s in statements:
            keys = s.keys()
            for k in keys:
                output.append(parse_statement(k, s[k]))
        return output
    elif t == type({}):
        output = {}
        keys = statements.keys()
        for key in keys:
            output[key] = prettify(statements[key])
        return output

    return 'BOOM'

print '---JSON---'
print json.dumps(prettify(statements), indent=2)
#print json.dumps(statements)
