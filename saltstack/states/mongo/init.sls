{% set saltstates = 'inflation-saltstates-mongo-datanode' %}

mongo_add_ppa_keys:
  cmd.run:
    - name: sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

mongo_add_repo:
  cmd.run:
    - name: echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list; sudo apt-get update

mongo_install:
  cmd.run:
    - name: sudo apt-get install -y mongodb-org

mongo_import_conf:
  file.managed:
    - name: /etc/mongod.conf
    - source: salt://mongo/mongod.conf

mongo_restart:
  cmd.run:
    - name: sudo systemctl start mongod