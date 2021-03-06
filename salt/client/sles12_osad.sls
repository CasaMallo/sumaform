# Run with:
# sudo salt-call --local state.sls client.sles12_osad

osad-bootstrap-script:
  file.managed:
    - name: /root/bootstrap-sles12-osad.sh
    - source: http://{{grains['server']}}/pub/bootstrap/bootstrap-sles12-osad.sh
    - source_hash: http://{{grains['server']}}/pub/bootstrap/bootstrap-sles12-osad.sh.sha512
    - mode: 755
  cmd.run:
    - name: /root/bootstrap-sles12-osad.sh
    - require:
      - file: osad-bootstrap-script

rhnsd:
  service.dead:
    - enable: False

osad:
  service.running:
    - enable: True
