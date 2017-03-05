import psqlparse
import pprint
import json
import prettify
import os

output = {}
sql = open('/Users/rikard.javelind/git/trustly/schema/public/FUNCTIONS/deposit.sql', 'r').read()
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
            x = 'CREATE OR REPLACE FUNCTION Deposit(OUT Url text, OUT OrderID bigint, _UserName text, _NotificationURL text, _EndUserID text, _MessageID text, _Attributes text) RETURNS record LANGUAGE plpgsql AS $$DECLARE _UserName text;_NotificationURL text;_EndUserID text;_MessageID text;_Attributes text;' + def_as + ' $$'
            #parsed = psqlparse.parse_plpgsql(x);
            print x
            #print json.dumps(parsed, indent=2)
        return {
            'type': t,
            'function_name': function_name,
            'return_catalog': return_catalog,
            'return_type': return_type,
            'language': def_language,
            'as': def_as
        }
    return statement
#print json.dumps(prettify2(statements), indent=2)
os.system('clear')
print json.dumps(prettify.prettify(statements), indent=2)
#print json.dumps(statements, indent=2)
