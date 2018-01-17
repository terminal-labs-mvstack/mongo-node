base:
  'roles:project':
    - match: grain
    - clean
    - basebox
    - basebox.symlink
    - users                     {# requires basebox #}
    - python
    - mongo
  'roles:prod':
    - match: grain
    - deploy_keys
  'roles:dev':
    - match: grain
    - users.aliases             {# requires users #}
