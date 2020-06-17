install rsyslog server:
  pkg.installed:
    - pkgs:
      - rsyslog

deploy rsyslog conf file:
  file.managed:
    - name: /etc/rsyslog.d/01-logserver.conf
    - source: salt://01-logserver.conf

Restart rsyslog server:
  service.running:
    - name: rsyslog
    - enable: true
    - reload: true
    - watch:
      - file: /etc/rsyslog.d/01-logserver.conf
    - cmd.run:
      -name: 'systemctl restart rsyslog'