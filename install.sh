#! /usr/bin/bash
#####################################################
##############此脚本用于安装和配置文件###############
#####################################################
#
##### 变量区 ######
# 密码
# 选择
choice=0
user=yzl178me
# 获得passwd   
echo 直接安装跳过基本设置请输入回车,否则输入1回车
read choice
if [ $choice == 1 ]; then
## 设置中国时区 ##
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc --utc

## 本地化也就是中文 ##
# 修改/etc/locale.gen文件，将zh_CN.UTF-8 UTF-8和en_US.UTF-8 UTF-8取消注释
chmod 777 /etc/locale.gen
echo -e "zh_CN.UTF-8 UTF-8\nen_US.UTF-8 UTF-8" >> /etc/locale.gen
chmod 644 /etc/locale.gen
# 输入  locale-gen  生成 locale 信息
locale-gen
pacman -S wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei

## pacman软件源设置 ##
# 修改/etc/pacman.conf 启用 Multilib 仓库，以下内容添加到文件结尾
chmod 777 /etc/pacman.conf
echo -e "[archlinuxcn]\nServer = https://mirrors.ustc.edu.cn/archlinuxcn/\$arch" >> /etc/pacman.conf
chmod 644 /etc/pacman.conf
# 输入pacman -S archlinuxcn-keyring 安装 archlinuxcn-keyring 包以导入 GPG key。
pacman -S archlinuxcn-keyring
# 输入pacman -Sy更新软件列表，也可以pacman -Syy强制更新
pacman -Syyu
# 更新系统：pacman -Syu
fi

## 克隆我的配置 ##
## ssh ##
while true
do
    if [ -e /usr/bin/ssh ]; then
        echo ssh已安装
        break
    fi
        pacman -S openssh
done
# 生成导入ssh
echo 输入1生成密钥
read choice
if [ choice == 1 ]; then
mkdir /home/$user/.ssh
cd /home/$user/.ssh
ssh-keygen -t rsa -C "1403341393@qq.com"
cat id_rsa.pub
echo 请导入密钥
read choice
fi
# 克隆配置文件
cd /home/$user
while true
do
    if [ -e /home/$user/My_Arch ]; then
        echo "配置文件已存在"
        break
    fi
        cd /home/$user
        git clone git@github.com:178me/My_Arch.git
    if [ -e /home/$user/Blog ]; then
        echo 博客已存在
        break
    fi
        git clone git@github.com:178me/178me.github.io.git
        mv 178me.github.io Blog
done

## vim ##
while true
do
    if [ -e /usr/bin/vim ]; then
        echo vim已安装
        break
    fi
        pacman -S vim
done

## NetworkManager ##
# 设置开机自启 systemctl enable NetworkManager.service 
while true
do
if [ -e /usr/lib/systemd/system/NetworkManager.service ]; then
    echo NetworkManager已安装
    systemctl enable NetworkManager.service
    break
fi
    pacman -S networkmanager
done

while true
do
if [ -e /usr/bin/nm-applet ]; then
    echo nm-applt已安装
    break
fi
    pacman -S network-manager-applet
done

## lightdm ##
# 这里情况有点复杂，就不自动开启服务了,可以讲一下步骤
# 找到你现在的登录管理器服务，然后使用systemctl disable XXX.service关掉
# 再开启lightdm，使用lightdm enable lightdm.service
while true
do
    if [ -e /usr/bin/lightdm ]; then
        echo lightdm已安装
        break
    fi
        pacman -S lightdm lightdm-gtk-greeter
done

# lightdm比较轻量，但是该有的功能都会有，修改背景图片，头像，位置都有
# 详细配置  https://wiki.archlinux.org/index.php/LightDM_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)

## 硬件配置 ##
# 触摸板
while true
do
    if [ -e /usr/bin/libinput ]; then
        echo 触摸板驱动已安装
            break
    fi
        pacman -S xf86-input-libinput
done

# 蓝牙
# 需手动开启蓝牙服务
while true
do
    if [ -e /usr/bin/blueberry ]; then
        echo 蓝牙驱动已安装
        systemctl enable bluetooth.service
        break
    fi
        pacman -S blueberry
done

# 音量和亮度的调节
while true
do
    if [ -e /usr/bin/pulseaudio-ctl ]; then
        echo 音量调节工具已安装
    else
        yay -S pulseaudio-ctl
    fi
    if [ -e /usr/bin/xbacklight ]; then
        echo 亮度调节已安装
        break
    else
        pacman -S xorg-xbacklight
    fi
done

## i3 ##
while true
do
    if [ -e /usr/bin/i3 ]; then
        echo i3已安装
        break
    fi
        pacman -S i3
done

## alacritty ##
while true
do
    if [ -e /usr/bin/alacritty ]; then
        echo alacritty 已安装
        break
    fi
        pacman -S alacritty compton
done

## fish ##
while true
do
    if [ -e /usr/bin/fish ]; then
        echo fish已安装
        break
        #chsh -s /usr/bin/fish
    fi
        pacman -S fish
done

## polybar ##
while true
do
    if [ -e /usr/bin/polybar ]; then
        echo poly已安装
        break
    fi
        pacman -S polybar
done

## fcitx-sogoupinyin ##
while true
do
    if [ -e /usr/bin/fcitx ]; then
        echo 输入法已安装
        break
    fi
        pacman -S fcitx fcitx-sogoupinyin fcitx-qt5 fcitx-configtool
done

## utools ##
while true
do
    if [ -e /usr/bin/utools ]; then
        echo utools已安装
        break
    fi
        yay -S utools
done

## unzip ##
while true
do
    if [ -e /usr/bin/unzip ]; then
        echo unzip已安装
        break
    fi
        pacman -S unzip
done

## variety ##
while true
do
    if [ -e /usr/bin/variety ]; then
        echo variety 已安装
        unzip wallpaper.zip
        mv -r ~/My_Arch/wallpaper ~/wallpaper
        break
    fi
        pacman -S variety
done

## chrome ##
while true
do
    if [ -e /usr/bin/google-chrome-stable ]; then
        echo chrome已安装
        break
    fi
        pacman -S google-chrome
done

## 网易云 ##
while true
do
    if [ -e /usr/bin/netease-cloud-music ]; then
        echo 网易云音乐已安装
        break
    fi
        netease-cloud-music
done

## 梯子 ##
while true
do
    if [ -e /usr/bin/electron-ssr ]; then
        echo ssr已安装
        break
    fi
        pacman -S electron-ssr
done

## telegram ##
while true
do
    if [ -e /usr/bin/telegram-desktop ]; then
        echo telegram已安装
        break
    fi
        pacman -S telegram-desktop
done

## ranger ##
while true
do
    if [ -e /usr/bin/ranger ]; then
        echo ranger已安装
        break
    fi
        pacman -S ranger
done

## smplayer ##
while true
do
    if [ -e /usr/bin/smplayer ]; then
        echo smplayer已安装
        break
    fi
        pacman -S smplayer
done

## chromium ##
while true
do
    if [ -e /usr/bin/chromium ]; then
        echo chromium已安装
        break
    fi
        pacman -S chromium
done

## flameshot ##
while true
do
    if [ -e /usr/bin/flameshot ]; then
        echo flameshot已安装
        break
    fi
        pacman -S flameshot
done

## xscreensaver ##
while true
do
    if [ -e /usr/bin/xscreensaver ]; then
        echo 屏保已安装
        break
    fi
        pacman -S xscreensaver
done

## man中文帮助 ##
pacman -S man-pages-zh_cn man-pages-zh_tw

## hexo ##
while true
do
    if [ -e /usr/bin/npm ]; then
        echo npm已安装
    fi
        pacman -S nodejs npm
    if [ -e /usr/bin/hexo ]; then
        echo hexo已安装
        break
    else
        npm config set registry https://registry.npm.taobao.org
        npm install -g hexo-cli
        npm install hexo-deployer-git –save
    fi
done











