<div align="center">
    <h1><strong>DOTFILES</strong></h1>
</div>

<details open>
<summary><strong>Instalar arcolinuxB bspwm</strong></summary>

Descargar la ISO de <https://sourceforge.net/projects/arcolinux-community-editions/files/> y escoger la version bspwm

Quemar la ISO a un pen con <https://www.balena.io/etcher/>
</details>

<details>
<summary><strong>Eliminar variety, .config/nanorc y pop-ups inicio</strong></summary>

Eliminamos variety para que no cambie de fondo de pantalla cada cierto tiempo

```console
sudo pacman -Rns variety
```

Borrar `.config/nanorc`. Si queremos cambiar la configuracion de nano está en
`/etc/nanorc`

```console
rm -r ~/.config/nanorc
```

Para poder seleccionar y copiar con el ratón y wrapear el texto en el
editor de nano haremos lo siguiente:

```console
nano /etc/nanorc
#Comentar las siguientes líneas:
#set mouse
#set linenumber
#Descomentar la línea:
#set softwrap
```

</details>

<details>
<summary><strong>Cambiar archivo de alacritty</strong></summary>
Primero añadir fuentes necesarias

```console
yay -S nerd-fonts-cascadia-code nerd-fonts-dejavu-complete nerd-fonts-fira-code;
sudo pacman -S powerline-common awesome-terminal-fonts
```

Ahora vamos a cambiar los archivos de configuracion que pone la distro 
automaticamente por los mios

```console
rm ~/.config/alacritty/alacritty.yml;
cp ~/dotfiles/alacritty.yml .config/alacritty/
```

</details>

<details>
<summary><strong>Setear mi configuración de bspwm, sxhkd y picom</strong></summary>

```console
rm -r ~/.config/bspwm/*;
cp -r ~/dotfiles/bspwm/* ~/.config/bspwm/
```

</details>

<details>
<summary><strong>Cambiar de bash a zsh</strong></summary>

```console
sudo chsh $USER -s /bin/zsh;
sudo chsh root -s /bin/zsh
```

Hacer un relog pulsando Super + X y despues L
</details>

<details>
<summary><strong>Configurar zsh</strong></summary>

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

En el archivo `~/.zshrc` añadimos a plugins y comentamos/borramos lo siguiente

```console
plugins=(
git
zsh-syntax-highlighting
zsh-autosuggestions
)
#Comentar la siguiente línea o borrarla
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

</details>

<details>
<summary><strong>Setear mi Polybar</strong></summary>

```console
rm -r .config/polybar/*;
cp -r ~/dotfiles/polybar/* .config/polybar/;
```

</details>

<details>
<summary><strong>Instalar chrome con yay y ponerlo como navegador
predeterminado</strong></summary>

```console
yay -S google-chrome;
export BROWSER="";
xdg-settings set default-web-browser google-chrome.desktop
```

</details>

<details>
<summary><strong>Configurar Audio</strong></summary>

```console
pavucontrol
```

1. Ir a la pestaña Configuration
2. Elegir los perfiles que queramos para cada salida de audio. Poner en Off si no queremos usar nunca esa salida
3. Ir a la pestaña Output Devices
4. Seleccionar como fallback (cuadrado derecho con icono circular y un tick) el audio principal

</details>

<details>
<summary><strong>Configurar bluetooth</strong></summary>

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
