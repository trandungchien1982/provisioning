#!/bin/bash
set -e

VM_NAME="vm-coredns"

# Install standard packages, e.g. Docker, Docker Compose, Java, Maven, Gradle, ...
echo "===================================="
echo "Current VM NAME: $VM_NAME"
echo "Call action after provision finish, prevent timeout error ..."
multipass transfer zz.01.install-packages.sh $VM_NAME:/home/ubuntu/
multipass exec $VM_NAME -- chmod +x /home/ubuntu/zz.01.install-packages.sh
multipass exec $VM_NAME -- /home/ubuntu/zz.01.install-packages.sh
echo "===================================="

echo "==> Done!"


Nhieu lan chot nghe sao thay long minh nho thuong
    Ky niem ngay xua
    Sao tiddsd
ldkdls
    Guc dau
        tung dem
        nghe co don
            dot tam tu
            ky niem ngay xua do
        muon co quen 
        lai nho them ....
    Ngay xua moi lan qua truoc nha em ...
    long nghe
        bao ngap ngung xao
        xuyen , so me biet chuyen minh ...


===============================================
THem bot noi dung
Toi con khong de tam.
Ong quan tam lam gi ???
--------------------------------------------