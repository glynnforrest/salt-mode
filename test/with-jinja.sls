{%- if True %}
some_service:
  pkg.installed
  file.managed:
    - source: salt://some_service.j2
    - template: jinja
  service.running:
    - name: some_service
    - enable: True
    - require:
      - pkg: some_service
      - file: some_service
{%- endif %}

{% for file in ['one', 'two', 'three'] %}
manage_file_{{file}}:
  file.managed:
    - name: /var/files/{{file}}.txt
    - source: salt://file.txt
{% endfor %}
