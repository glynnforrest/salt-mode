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

state with spaces:
  cmd.run:
    - name: 'hostname'

/etc/some_service/file.conf:
  pkg.installed:
    - source: salt://file.conf

state_with_newlines:
  cmd.run:
    - name: 'cat /etc/passwd'

  service.dead:
    - name: sshd
