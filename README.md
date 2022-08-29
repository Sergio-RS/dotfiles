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
<summary><strong>Clonar el repositorio</strong></summary>
<br>

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

```console
sudo pacman -S lsd powerline-common awesome-terminal-fonts bspwm sxhkd rofi polybar dunst pulseaudio feh brightnessctl playerctl flameshot bc bluez bluez-utils
```

</details>

# 

<details>
<summary><strong>Configuración github</strong></summary>
<br>

Setear git config y generar shh key

```console
git config --global user.name "Sergio-RS";
git config --global user.email "sergio.rodriguez.seoane@udc.es";
ssh-keygen -o -t rsa -C "sergio.rodriguez.seoane@udc.es";
cat .ssh/id_rsa.pub
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
cp -r ~/dotfiles/alacritty ~/.config/gtheme/desktops/gtheme-sergio/.config/alacritty
cp -r ~/dotfiles/bspwm ~/.config/gtheme/desktops/gtheme-sergio/.config/bspwm
cp -r ~/dotfiles/kitty ~/.config/gtheme/desktops/gtheme-sergio/.config/kitty
cp -r ~/dotfiles/picom ~/.config/gtheme/desktops/gtheme-sergio/.config/picom
cp -r ~/dotfiles/polybar ~/.config/gtheme/desktops/gtheme-sergio/.config/polybar
cp -r ~/dotfiles/rofi ~/.config/gtheme/desktops/gtheme-sergio/.config/rofi
cp -r ~/dotfiles/sxhkd ~/.config/gtheme/desktops/gtheme-sergio/.config/sxhkd
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
cp ~/dotfiles/alacritty.yml .config/alacritty/
```

</details>

#

<details>
<summary><strong>Setear mi configuración de bspwm, sxhkd y picom</strong></summary>
<br>

```console
rm -rf ~/.config/bspwm/*;
cp -r ~/dotfiles/bspwm/* ~/.config/bspwm/;
betterlockscreen -u ~/.config/bspwm/betterlockscreen.png
```

1. Asegurarse que en el fichero `.config/bspwm/bspwmrc` la variable
***primary_monitor*** coincide con el monitor que queremos usar como principal. Para consultar los monitores podemos usar xrandr

2. Asegurarse que en el fichero `.config/bspwm/autostart.sh` la variable
***external_monitor*** coincide con el monitor que queremos usar como secundario.

</details>

#

<details>
<summary><strong>Configurar rofi (buscador de aplicaciones)</strong></summary>
<br>

```console
rm -rf ~/.config/rofi/*;
cp ~/dotfiles/rofi/* ~/.config/rofi
```

</details>

#

<details>
<summary><strong>Setear mi Polybar</strong></summary>
<br>

Elegir el comando para copiar la polybar de desktop o de laptop

```console
rm -rf ~/.config/polybar/*;
cp -r ~/dotfiles/polybar/* ~/.config/polybar/
#Polybar de desktop
cp ~/dotfiles/polybar-configs/desktop/config ~/.config/polybar/
#Polybar de laptop
cp ~/dotfiles/polybar-configs/laptop/config ~/.config/polybar/
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

1. Establecer configuracion de pantalla con xrandr sin hdmi y guardarla en autorand

```console
xrandr --output eDP-1 --primary --mode 1920x1080 --rotate normal;
autorand -s undocked
```

2. Establecer configuracion de pantalla con xrandr con hdmi conectado al segundo monitor y guardarla en autorand

```console
#cambiar ultimo parametro si el monitor secundario esta a la derecha del primario por --right-of eDP-1
xrandr --output eDP-1 --primary --mode 1920x1080 --rotate normal --output HDMI-1 --mode 1920x1080 --rotate normal --left-of eDP-1;
autorand -s undocked
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

Establecer login visualmente mas bonito

```console
sudo pacman -S sddm-sugar-candy-git;
sudo rm /usr/share/sddm/themes/sugar-candy/theme.conf;
sudo cp ~/dotfiles/sddm/theme.conf /usr/share/sddm/themes/sugar-candy;
sudo cp ~/dotfiles/sddm/sddm.conf /etc
```

Borrar todas las carpetas innecesarias de `/home/USUARIO` y crear la carpeta de descargas `downloads`

```console
rm -rf carpeta;
mkdir downloads
```

Establecer carpeta de descargas de chrome la que creamos como `downloads`

1. Ir a las settings de chrome
2. Buscar descargas en el panel de la izquierda
3. Cambiar la carpeta default por la nueva

Descargar Visual Studio Code

```console
yay -S visual-studio-code-bin
```

Emojis de google. Para visualizarlos bien en yt

```console
sudo pacman -S noto-fonts-emoji
```

Poner touchpad invertido

```console
sudo rm /etc/X11/xorg.conf.d/30-touchpad.conf;
sudo cp ~/dotfiles/30-touchpad.conf /etc/X11/xorg.conf.d/
```

Arreglar error alacritty diferentes tamaños de fuente entre 2 monitores

```console
sudo nano /etc/envioroment
#Añadir la siguiente línea
WINIT_X11_SCALE_FACTOR=1.5
```

Configurar tema de escritorio o mouse

1. `Super + a` para abrir el buscador de apliaciones
2. Buscar customize look and feel
3. Elegir las settings deseadas

Eliminar mensaje Welcome to grub! Seguir los pasos de este github

<https://github.com/ccontavalli/grub-shusher>

</details>
