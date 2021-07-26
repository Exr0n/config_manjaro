# assumes each object in a list has the same structure
# TODO: continue in outer loop for empty arrays
# TODO: check that entire array matches spec

import json
import sys

TYPES = {
    str: 'String',
    int: 'i128',
    bool: 'bool',
    float: 'f64',
}

STRUCT_TEMPLATE = '''
    #[derive(Serialize, Deserialize, Debug)]
    pub struct {} {{
{}
    }}
'''

structs = f'''
mod JsonSpec_{sys.argv[1] if len(sys.argv) > 1 else 'json_spec'} {{
    use serde::{{ Serialize, Deserialize }};'''

def parse_spec(obj, name, path="", ismain=True):
    path += name
    try:
        return TYPES[type(obj)]
    except KeyError:
        if isinstance(obj, list):
            typ = parse_spec(obj[0], '', path, False) if len(obj) > 0 else '(/* TODO: UNKNOWN */)'
            return f"Vec<{typ}>"
        if isinstance(obj, dict):
            global structs
            contents = []
            for k, v in obj.items():
                contents.append((k, parse_spec(v, k + "_", path, False)))
            contents = '\n'.join(f"        pub {n}: {t}," for n, t in contents)
            if ismain:
                structs += STRUCT_TEMPLATE.format('spec', contents)
            else:
                structs += STRUCT_TEMPLATE.format(path[:-1], contents)
            return path[:-1]
        else:
            raise KeyError(f"Unknown type '{type(obj)}' found in json!", obj)


if __name__ == '__main__':
    obj = ''.join(sys.stdin)
    parse_spec(json.loads(obj), sys.argv[1] + '_' if len(sys.argv) > 1 else '')
    print(structs + "}\n")
