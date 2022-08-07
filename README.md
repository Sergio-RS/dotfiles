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
<summary><strong>Actualizar la distro y instalar dependencias</strong></summary>
<br>

```console
mirror;
yay -Syyu;
update;
#Si salta error signature from "David Runge <dvzrv@archlinux.org>"...poner lo siguiente
sudo pacman -S archlinux-keyring; update 
```

Setear git config y generar shh key

```console
git config --global user.name "Sergio-RS";
git config --global user.email "sergio.rodriguez.seoane@udc.es";
ssh-keygen -o -t rsa -C "sergio.rodriguez.seoane@udc.es";
cat .ssh/id_rsa.pub
```

Descargar lsd

```console
sudo pacman -S lsd
```

Fuentes necesarias

```console
yay -S nerd-fonts-cascadia-code nerd-fonts-dejavu-complete nerd-fonts-fira-code;
sudo pacman -S powerline-common awesome-terminal-fonts
```

Para controlar el brillo

```console
sudo pacman -S brightnessctl
```

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
sudo rm /etc/nanorc
sudo cp ~/dotfiles/nanorc /etc
```

</details>

#

<details>
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
betterlockscreen -u .config/bspwm/betterlockscreen.png
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
rm ~/.zshrc
cp ~/dotfiles/.zshrc ~/
```

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
cp /home/USUARIO/dotfiles/.p10k.zsh ~/
```

Borrar la carpeta `~/.config/nano` para tener las settings comunes que están en
`/etc/nanorc`

Para tener en root tambien el fzf tenemos que volver a instalarlo en root.
Desde la consola de root:

```console
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf;
~/.fzf/install
```

</details>

#

<details>
<summary><strong>Extras</strong></summary>
<br>

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
sudo rm /etc/X11/xorg.conf.d/30-touchpad.conf
sudo cp ~/dotfiles/30-touchpad.conf /etc/X11/xorg.conf.d/
```

Arreglar error alacritty diferentes tamaños de fuente entre 2 monitores

```console
sudo nano /etc/envioroment
#Añadir la siguiente línea
WINIT_X11_SCALE_FACTOR=1.5
```

Configurar lo que hacer al cerrar la tapa:

1. `Super + a` para abrir el buscador de apliaciones
2. Buscar power manager
3. Elegir las settings deseadas  

Configurar tema de escritorio o mouse

1. `Super + a` para abrir el buscador de apliaciones
2. Buscar customize look and feel
3. Elegir las settings deseadas

</details>
