/home/vagrant/test:
  file.directory:
    - user: vagrant
    - group: vagrant

# with raw content

/home/vagrant/test/contents.txt:
  file.managed:
    - contents: dummy foo

# with state data

/home/vagrant/test/serialize.yaml:
  file.serialize:
    - dataset:
        foo: aaaa
        bar: null
        qux: true

/home/vagrant/test/templated.yaml:
  file.managed:
    - source: salt://tpl.yaml
    - template: jinja
    - context:
        foo: aaaa
        bar: null
        qux: true

/home/vagrant/test/serialize.json:
  file.serialize:
    - dataset:
        foo: aaaa
        bar: null
        qux: true
    - formatter: json

/home/vagrant/test/templated.json:
  file.managed:
    - source: salt://tpl.json
    - template: jinja
    - context:
        foo: aaaa
        bar: null
        qux: true

# with pillar data

/home/vagrant/test/pil-serialize.yaml:
  file.serialize:
    - dataset: {{ pillar.config }}

/home/vagrant/test/pil-templated.yaml:
  file.managed:
    - source: salt://tpl.yaml
    - template: jinja
    - context: {{ pillar.config }}

/home/vagrant/test/pil-serialize.json:
  file.serialize:
    - dataset: {{ pillar.config }}
    - formatter: json

/home/vagrant/test/pil-templated.json:
  file.managed:
    - source: salt://tpl.json
    - template: jinja
    - context: {{ pillar.config }}
