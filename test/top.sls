base:
  *:
    - salt.minion
  salt:
    - salt.master
  'os:Debian':
    - match: grain
    - apt
    - syslog
