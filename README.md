<div align="center">
    <h1><strong>DOTFILES</strong></h1>
</div>

<details open>
<summary><strong>1. Instalar arcolinuxB bspwm</strong></summary>
Descargar la ISO de https://sourceforge.net/projects/arcolinux-community-editions/files/ y
escoger la version bspwm

Quemar la ISO a un pen con <https://www.balena.io/etcher/>
</details>

<details open>
<summary><strong>2. Eliminar variety, .config/nanorc, pop-ups inicio y setear fondo de pantalla</strong></summary>

Eliminamos variety para que no cambie de fondo de pantalla cada cierto tiempo

```console
sudo pacman -Rns variety
```

Borrar .config/nanorc. Si queremos cambiar la configuracion de nano esta está en /etc/nanorc

```console
rm -r .config/nanorc
```

Si tenemos problemas para seleccionar texto y copiarlo en nano comentar la línea set mouse en /etc/nanorc
Eliminar/Comentar las siguientes lineas en ~/.config/bspwm/autostart.sh

```console
run variety &
dex $HOME/.config/autostart/arcolinux-welcome-app.desktop
conky -c $HOME/.config/bswpwm/system-overview &
```

Poner la ruta del nuevo wallpaper en ~/.config/bspwm/autostart.sh. Por ejemplo:

```console
feh --bg-fill $HOME/.config/bspwm/sunset-mountain.jpg &
```

</details>

<details open>
<summary><strong>3. Setear sxhkd commands</strong></summary>

```console
rm -r ~/.config/.config/bspwm/sxhkd/scripts;
cp -r ~/dotfiles/bspwm/sxhkd/scripts $HOME/.config/bspwm/sxhkd/;
rm ~/.config/bspwm/sxhkd/sxhkdrc;
cp ~/dotfiles/bspwm/sxhkd/sxhkdrc
```

</details>

<details open>
<summary><strong>4. Instalar chrome con yay y ponerlo como navegador predeterminado</strong></summary>

```console
yay -S google-chrome;
export BROWSER="";
xdg-settings set default-web-browser google-chrome.desktop
```

Poner un comando para iniciarlo:

```console
nano ~/.config/bspwm/sxhkd/sxhkdrc
```

Cambiar el de chromium por chrome:

```console
google-chrome-stable
```

</details>

<details open>
<summary><strong>5. Cambiar de bash a zsh</strong></summary>

```console
sudo chsh $USER -s /bin/zsh;
sudo chsh root -s /bin/zsh
```

Hacer un relog pulsando Super + X y despues L
</details>

<details open>
<summary><strong>6. Cambiar archivos de alacritty, picom y bspwmrc</strong></summary>
Primero añadir fuentes necesarias

```console
yay -S nerd-fonts-cascadia-code nerd-fonts-dejavu-complete;
sudo pacman -S powerline-common awesome-terminal-fonts
```

Ahora vamos a cambiar los archivos de configuracion que pone la distro automaticamente por los mios

```console
cd;
rm .config/alacritty/alacritty.yml;
cp dotfiles/alacritty.yml .config/alacritty/;
rm .config/bspwm/picom.conf;
cp dotfiles/picom.conf .config/bspwm/;
rm .config/bspwm/bspwmrc;
cp dotfiles/bspwmrc .config/bspwm/
```

</details>

<details open>
<summary><strong>7. Configurar zsh</strong></summary>

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
cd;
sudo cp -r /usr/share/zsh/plugins/zsh-syntax-highlighting /usr/share/oh-my-zsh/plugins;
sudo git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share/oh-my-zsh/plugins 
```

En el archivo ~/.zshrc añadimos a plugins y comentamos lo siguiente

```console
plugins=(
git
zsh-syntax-highlighting
zsh-autosuggestions
)
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

</details>

<details open>
<summary><strong>8. Polybar</strong></summary>

```console
cd;
rm .config/polybar/config;
rm -rf .config/polybar/scripts;
cp dotfiles/polybar/config .config/polybar/;
cp -r dotfiles/polybar/scripts .config/polybar/
```

</details>
