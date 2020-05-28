# Backup-Server-0.2-1

Agora, no Proxmox, você pode fazer backup no armazenamento local, ou em um servidor de arquivos. O servidor de backup Proxmox é um servidor separado que você pode usar em vez de um servidor de arquivos cifs / nfs. Você pode montar o servidor de backup Proxmox como um servidor de arquivos cifs / nfs e, em seguida, usar o backup proxmox regular para fazer backup no servidor de backup Proxmox. Os backups não são diferenciais ou incrementais, mas são deduplicados. Isso significa que o tempo de backup permanecerá o mesmo, mas o armazenamento necessário para armazenar os backups será reduzido significativamente.

O servidor de backup Promox ainda não está pronto para uso. Os backups para contêineres ainda não funcionam. e restaurar também o trabalho dosente ainda. a maioria das coisas tem que ser feita via linha de comando atualmente. Se você ainda deseja testar o servidor de backup proxmox, posso fornecer um contêiner pré-instalado.

Utilize um container, docker ou VM separado com Debian 10 Buster

Após a compilação finalizar com exito, acesso pelo seu navegador:

https://IP_do_HOST:8007
