<div align="center">
    <h1><strong>DOTFILES</strong></h1>
</div>

<details open>
<summary><strong>Instalar arcolinuxB bspwm</strong></summary>
<br>

Descargar la ISO de
<https://sourceforge.net/projects/arcolinux-community-editions/files/> y
escoger la version bspwm

Quemar la ISO a un pen con <https://www.balena.io/etcher/>
</details>

#

<details>
<summary><strong>Clonar el repositorio y setear config github</strong></summary>
<br>

Setear git config y generar shh key

```console
git config --global user.name "Sergio-RS";
git config --global user.email "sergio.rodriguez.seoane@udc.es";
ssh-keygen -o -t rsa -C "sergio.rodriguez.seoane@udc.es";
cat .ssh/id_rsa.pub
```

Clonar repositiorio

```console
git clone https://github.com/Sergio-RS/dotfiles.git ~/dotfiles
```

</details>

#

<details>
<summary><strong>Actualizar distro</strong></summary>
<br>

```console
sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/1mirrorlist;
sudo pacman -S archlinux-keyring; #Evitar error al actualizar 
yay -Syyyu;
sudo pacman -Syyyu;
```

</details>

#

<details>
<summary><strong>Instalar dependencias</strong></summary>
<br>

Apps, utilidades, fuentes e iconos

```console
sudo pacman -S bspwm sxhkd rofi polybar picom dunst pulseaudio feh brightnessctl lsd playerctl flameshot bc bluez bluez-utils alacritty kitty discord neofetch powerline-common awesome-terminal-fonts papirus-icon-theme noto-fonts-emoji
```

Fuentes

```console
yay -S nerd-fonts-cascadia-code nerd-fonts-dejavu-complete nerd-fonts-fira-code
```

</details>

#

<details>
<summary><strong>Eliminar variety, .config/nanorc y pop-ups inicio</strong></summary>
<br>

Eliminamos variety para que no cambie de fondo de pantalla cada cierto tiempo

```console
sudo pacman -Rns variety
```

Borrar `.config/nanorc`. Si queremos cambiar la configuracion de nano está en
`/etc/nanorc`

```console
rm -rf ~/.config/nano
```

Para poder seleccionar y copiar con el ratón y wrapear el texto en el
editor de nano haremos lo siguiente:

```console
sudo rm /etc/nanorc;
sudo cp ~/dotfiles/nanorc /etc
```

</details>

#

<details>
<summary><strong>Cambiar de bash a zsh</strong></summary>
<br>

```console
sudo chsh $USER -s /bin/zsh;
sudo chsh root -s /bin/zsh
```

Hacer un relog pulsando Super + X y despues L
</details>

#

<details>
<summary><strong>Configurar zsh</strong></summary>
<br>

```console
yay -S zsh-theme-powerlevel10k-git;
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
```

Cerramos la terminal, abrimos otra y hacemos

```console
p10k configure
```

Ahora instalamos los plugins en el directorio deseado

```console
sudo cp -r /usr/share/zsh/plugins/zsh-syntax-highlighting /usr/share/oh-my-zsh/plugins;
sudo git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share/oh-my-zsh/plugins/zsh-autosuggestions
```

Borramos archivo `~/.zshrc` y ponemos el que tiene mi configuración

```console
rm ~/.zshrc;
cp ~/dotfiles/zsh/.zshrc ~/
```

</details>

#

<details>
<summary><strong>Configuracion alacritty, bspwm, sxhkd, picom, rofi, polybar</strong></summary>
<br>

<details open>
<summary><strong>Mediante gtheme</strong></summary>

1. Instalar gtheme <https://github.com/daavidrgz/gtheme>

2. Copiar config del desktop a la capeta correspondiente de gtheme

```console
cp -r ~/dotfiles/gtheme-sergio ~/.config/gtheme/desktops/gtheme-sergio;
mkdir ~/.config/gtheme/desktops/gtheme-sergio/.config;
cp -r ~/dotfiles/.config/* ~/.config/gtheme/desktops/gtheme-sergio/.config/
```

3. Setear configuracion

```console
gtheme desktop apply gtheme-sergio
```

</details>

<details>
<summary><strong>Por linea de comandos sin gtheme</strong></summary>
<br>

<details open>
<summary><strong>Cambiar archivo de alacritty</strong></summary>
<br>

Ahora vamos a cambiar los archivos de configuracion que pone la distro
automaticamente por los mios

```console
rm ~/.config/alacritty/alacritty.yml;
cp ~/dotfiles/.config/alacritty/alacritty.yml .config/alacritty/
```

</details>

<details>
<summary><strong>Setear mi configuración de bspwm, sxhkd y picom</strong></summary>
<br>

```console
rm -rf ~/.config/bspwm/*;
cp -r ~/dotfiles/.config/bspwm/* ~/.config/bspwm/;
betterlockscreen -u ~/dotfiles/wallpapers/windows-panic.png
```

1. Asegurarse que en el fichero `.config/bspwm/bspwmrc` la variable
***primary_monitor*** coincide con el monitor que queremos usar como principal. Para consultar los monitores podemos usar xrandr

2. Asegurarse que en el fichero `.config/bspwm/autostart.sh` la variable
***external_monitor*** coincide con el monitor que queremos usar como secundario.

</details>

<details>
<summary><strong>Configurar rofi (buscador de aplicaciones)</strong></summary>
<br>

```console
rm -rf ~/.config/rofi/*;
cp ~/dotfiles/.config/rofi/* ~/.config/rofi
```

</details>

<details>
<summary><strong>Setear mi Polybar</strong></summary>
<br>

Elegir el comando para copiar la polybar de desktop o de laptop

```console
rm -rf ~/.config/polybar/*;
cp -r ~/dotfiles/.config/polybar/* ~/.config/polybar/
```

</details>
</details>
</details>

#

<details>
<summary><strong>Instalar fzf (para hacer fuzzing por directorios y ctrl + r)</strong></summary>
<br>

```console
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf;
~/.fzf/install
```

</details>

#

<details>
<summary><strong>Instalar chrome con yay y ponerlo como navegador
predeterminado</strong></summary>
<br>

```console
yay -S google-chrome;
export BROWSER="";
xdg-settings set default-web-browser google-chrome.desktop
```

</details>

#

<details>
<summary><strong>Configurar Audio</strong></summary>
<br>

```console
pavucontrol
```

1. Ir a la pestaña Configuration
2. Elegir los perfiles que queramos para cada salida de audio. Poner en Off si
no queremos usar nunca esa salida
3. Ir a la pestaña Output Devices
4. Seleccionar como fallback (cuadrado derecho con icono circular y un tick)
el audio principal

</details>

#

<details>
<summary><strong>Configurar bluetooth</strong></summary>
<br>

Setear Autoenable=true en `/etc/bluetooth/main.conf`

Mirar si el servicio de bluetooth está corriendo. En caso de que no lo estea
iniciarlo y activarlo para la siguiente vez que se encienda el pc

```console
sudo systemctl status bluetooth.service
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
```

Ahora vamos a configurar algún dispositivo bluetooth

```console
bluetoothctl
#Dentro de la consola de bluetoothctl
power on
#agent on y default para que conecte automáticamente cualquiera dispositivo bluetooth que estea en modo trusted
agent on
default-agent
#Ahora escaneamos dispositivos
scan on
#Una vez tengamos el que queremos 
trust *MAC* #MAC es la del dispositivo que queremos
pair *MAC*
#Nos pedirá o que aceptemos el código o que lo escribamos para hacer el pairing
connect *MAC*
```

</details>

#

<details>
<summary><strong>Configuracion usuario root (zsh, nanorc, fzf...)</strong></summary>
<br>

Haremos un link simbólico. La zsh de root apuntará a la del usuario normal.
Poner en ***USUARIO*** el nombre de usuario que se usa normalmente

```console
sudo su;
ln -s -f /home/USUARIO/.zshrc /root/.zshrc;
#Cerramos terminal y abrimos otra
sudo su;
#Configurar p10k y si no sale el promp hacemos:
p10k configure
```

Para configurar el prompt de root y que se sepa que somos superusuarios haremos
desde root:

```console
rm ~/.p10k.zsh;
cp /home/USUARIO/dotfiles/zsh/.p10k.zsh ~/
```

Borrar la carpeta `~/.config/nano` para tener las settings comunes que están en
`/etc/nanorc`

```console
rm -rf ~/.config/nano
```

Para tener en root tambien el fzf tenemos que volver a instalarlo en root.
Desde la consola de root:

```console
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf;
~/.fzf/install
```

</details>

#

<details>
<summary><strong>Configurar doble monitor</strong></summary>
<br>

<details open>
<summary><strong>Configuracion paso a paso</strong></summary>
<br>

Ejemplo con monitor **primario** `eDP-1` y monitor **secundario** `HDMI-1`

1. Establecer configuracion de pantalla con xrandr sin hdmi y guardarla en autorandr

```console
xrandr --output eDP-1 --primary --mode 1920x1080 --rotate normal;
autorandr -s undocked
```

2. Establecer configuracion de pantalla con xrandr con hdmi conectado al segundo monitor y guardarla en autorandr

```console
#cambiar ultimo parametro si el monitor secundario esta a la derecha del primario por --right-of eDP-1
xrandr --output eDP-1 --primary --mode 1920x1080 --rotate normal --output HDMI-1 --mode 1920x1080 --rotate normal --left-of eDP-1;
autorandr -s docked
```

3. Copiar scripts necesarios

```console
cp ~/dotfiles/autorandr/docked/postswitch ~/.config/autorandr/docked;
cp ~/dotfiles/autorandr/undocked/postswitch ~/.config/autorandr/undocked;
cp ~/dotfiles/autorandr/preswitch ~/.config/autorandr/
```

4. Verificar que las variables ***internal_monitor*** (monitor que usaremos como
primario) y ***external_monitor*** en el fichero
`~/.config/autorandr/docked/postswitch` coinciden con los valores deseados

</details>

<details>
<summary><strong>Configurar mi caso personal</strong></summary>
<br>

```console
cp -r ~/dotfiles/autorandr/* ~/.config/autorandr
```

</details>

</details>

#

<details>
<summary><strong>Configurar acciones al cerrar la tapa del portatil</strong></summary>
<br>

```console
sudo rm /etc/systemd/logind.conf;
sudo cp ~/dotfiles/logind.conf /etc/systemd
```

Mirar si funciona correctamente haciendo un reboot. Si hai algun problema
intentar comentar todas las lineas del fichero
`/etc/systemd/logind.conf.d/do-not-suspend.conf`

```console
sudo nano /etc/systemd/logind.conf.d/do-not-suspend.conf
```

Si queremos configurarlo por interfaz grafica (menos opciones):

1. Descomentar del fichero `~/.config/bspwm/autostart.sh` la linea run `xfce4-power-manager &`
2. `Super + a` para abrir el buscador de apliaciones
3. Buscar power manager
4. Elegir las settings deseadas
5. Reboot para aplicar cambios

</details>

#

<details>
<summary><strong>Solucionar error hora incorrecta en windows al tener dual boot</strong></summary>
<br>

1. En una consola de arcolinux hacer:

```console
timedatectl set-local-rtc 1 --adjust-system-clock
```

2. Ir a windows y entrar en configuracion de fecha y hora
3. Desmarcar el boton de establecer fecha automaticamente
4. Marcar boton para establecer fecha automaticamente

</details>

#

<details>
<summary><strong>Extras</strong></summary>
<br>

Establecer login visualmente mas bonito:

```console
sudo pacman -S sddm-sugar-candy-git;
sudo rm /usr/share/sddm/themes/sugar-candy/theme.conf;
sudo cp ~/dotfiles/sddm/theme.conf /usr/share/sddm/themes/sugar-candy;
sudo cp ~/dotfiles/sddm/sddm.conf /etc
```

Borrar todas las carpetas innecesarias de `/home/USUARIO` y crear la carpeta de descargas `downloads`:

```console
rm -rf carpeta;
mkdir downloads
```

Establecer carpeta de descargas de chrome la que creamos como `downloads`:

1. Ir a las settings de chrome
2. Buscar descargas en el panel de la izquierda
3. Cambiar la carpeta default por la nueva

Descargar Visual Studio Code

```console
yay -S visual-studio-code-bin
```

Poner touchpad invertido:

```console
sudo rm /etc/X11/xorg.conf.d/30-touchpad.conf;
sudo cp ~/dotfiles/30-touchpad.conf /etc/X11/xorg.conf.d/
```

Cambiar escalado alacritty al tener dos monitores:

1. Se puede hacer editando el fichero `alacritty.yml`

```console
nano ~/.config/alacritty/alacritty.yml
#Editar la línea que sea como la siguiente poniendo en 1.4 el valor deseado
WINIT_X11_SCALE_FACTOR=1.4
```

2. O podemos editar la variable de entorno directamente

```console
sudo nano /etc/envioroment
#Añadir la siguiente línea
WINIT_X11_SCALE_FACTOR=1.4
```

Configurar tema de escritorio o mouse:

1. `Super + a` para abrir el buscador de apliaciones
2. Buscar customize look and feel
3. Elegir las settings deseadas

Para popular las keys de pacman:

```console
sudo pacman-key --init
sudo pacman-key --populate
sudo pacman-key --refresh-keys
sudo pacman -Sy archlinux-keyring
```

Si hay error de keys con los repositorios de arcolinux al hacer
un update o intentar instalar algo:

```console
sudo nano /etc/systemd/system/pacman-init.service

#Cambiar el contenido por lo siguiente:
[Unit]
Description=Initializes Pacman keyring

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/bin/pacman-key --init
ExecStart=/usr/bin/pacman-key --populate

[Install]
WantedBy=multi-user.target
```

Programa para editar pdf:

```console
sudo pacman -S okular
```

Comando okular para abrir pdf y que no dependa de esa terminal:

```console
okular nombre-archivo.pdf &; disown
```

Manejo distintas versiones java:

1. Para instalar versiones:

```console
sudo pacman -S openjdk11-src #Cambiar 11 por la version deseada
```

2. Para mirar que jdk está en uso:

```console
archlinux-java status
```

3. Para cambiar el jdk en uso:

```console
sudo archlinux-java set java-11-openjdk #Cambiar 11 por la versión deseada
```

</details>
