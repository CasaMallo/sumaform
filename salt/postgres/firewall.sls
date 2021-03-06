include:
  - sles.repos

firewall:
  pkg.installed:
    - name: SuSEfirewall2
    - require:
      - sls: sles.repos

{% if grains['for-development-only'] %}

disable-firewall:
  service.dead:
    - name: SuSEfirewall2
    - enable: False

{% else %}

configure-firewall:
  file.replace:
    - name: /etc/sysconfig/SuSEfirewall2
    - pattern: |
        ^FW_SERVICES_EXT_TCP
    - repl: |
        FW_SERVICES_EXT_TCP="postgresql ssh"
    - append_if_not_found: True
    - require:
      - pkg: firewall

{% endif %}
