# firewall-bypass
Scripts para testagem de bypass de firewalls em sistemas linux.

A ferrmenta fwbypass.sh possui a capacidade de verificar as possíveis rotas de saídas pelo firewall. Ela automatiza o processo de abertura de conexões TCP, facilitando a identificação das portas permitidas para comunicação externa.
#
Para utilizar o script fwbypass.sh, é necessário primeiramente executar, no host atacante, o script openports.sh, o qual
automatiza o processo abertura de portas.
As portas testadas pelo script fwbypass.sh terão de ser as mesmas portas abertas pelo script openports.sh.
