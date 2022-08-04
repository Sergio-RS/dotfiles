<div align="center">
    <h1><strong>DOTFILES</strong></h1>
</div>

<details open>
<summary><strong>Instalar arcolinuxB bspwm</strong></summary>
<br>

Descargar la ISO de <https://sourceforge.net/projects/arcolinux-community-editions/files/> y escoger la version bspwm

Quemar la ISO a un pen con <https://www.balena.io/etcher/>
</details>

#

<details>
<summary><strong>Actualizar la distro y instalar dependencias</strong></summary>
<br>

```console
mirror;
update;
yay -Syyu
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
rm -rf ~/.config/nanorc
```

Para poder seleccionar y copiar con el ratón y wrapear el texto en el
editor de nano haremos lo siguiente:

```console
nano /etc/nanorc
#Comentar las siguientes líneas:
#set mouse
#set linenumber
#Descomentar la línea:
set softwrap
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
cp -r ~/dotfiles/bspwm/* ~/.config/bspwm/
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
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc>;
```

Cerramos la terminal, abrimos otra y hacemos

```console
p10k configure
```

Ahora instalamos los plugins en el directorio deseado

```console
sudo cp -r /usr/share/zsh/plugins/zsh-syntax-highlighting /usr/share/oh-my-zsh/plugins;
sudo git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share/oh-my-zsh/plugins 
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
<summary><strong>Setear mi Polybar</strong></summary>
<br>

```console
rm -rf .config/polybar/*;
cp -r ~/dotfiles/polybar/* .config/polybar/;
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
2. Elegir los perfiles que queramos para cada salida de audio. Poner en Off si no queremos usar nunca esa salida
3. Ir a la pestaña Output Devices
4. Seleccionar como fallback (cuadrado derecho con icono circular y un tick) el audio principal

</details>

#

<details>
<summary><strong>Configurar bluetooth</strong></summary>
<br>

Setear Autoenable=true en `/etc/bluetooth/main.conf`

Mirar si el servicio de bluetooth está corriendo. En caso de que no lo estea iniciarlo y activarlo para la siguiente vez que se encienda el pc

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
<summary><strong>Setear zsh de root</strong></summary>
<br>

Haremos un link simbólico. La zsh de root apuntará a la del usuario normal. Poner en ***USUARIO*** el nombre de usuario que se usa normalmente

```console
sudo su;
ln -s -f /home/USUARIO/.zsh;
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k;
#Cerramos terminal y abrimos otra
sudo su;
p10k configure
#Borramos el archivo de github
rm -rf powerlevel10k
```

Para configurar el prompt de root y que se sepa que somos superusuarios haremos desde root:

```console
rm ~/.p10k.zsh
cp /home/USUARIO/dotfiles/.p10k.zsh ~/
```

Para tener en root tambien el fzf tenemos que volver a instalarlo en root. Desde la consola de root:

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
<summary><strong>Extras</strong></summary>
<br>

Descargar Visual Studio Code

```console
yay -S visual-studio-code-bin
```

</details>
