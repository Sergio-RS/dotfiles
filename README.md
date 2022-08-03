<div align="center"> 
    <h1><strong>DOTFILES</strong></h1> 
</div>

<details open>
<summary><strong>Instalar arcolinuxB bspwm</strong></summary>
Descargar la ISO de https://sourceforge.net/projects/arcolinux-community-editions/files/ y 
escoger la version bspwm

Quemar la ISO a un pen con https://www.balena.io/etcher/
<details>

<details open>
<summary><strong>&nbsp;Eliminar variety ,setear fondo de pantalla y eliminar pop-ups inicio<strong><summary> 

Eliminamos variety para que no cambie de fondo de pantalla cada cierto tiempo
```console
sudo pacman -Rns variety
```

Poner la ruta del nuevo wallpaper en ~/.config/bspwm/autostart.sh. Por ejemplo:

```console
feh --bg-fill $HOME/.config/bspwm/sunset-mountain.jpg &
```

Eliminar/Comentar las siguientes lineas en ~/.config/bspwm/autostart.sh

```console
run variety &
dex $HOME/.config/autostart/arcolinux-welcome-app.desktop
conky -c $HOME/.config/bswpwm/system-overview &
```

<details>
4. Instalar chrome con yay y ponerlo como navegador predeterminado
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

5. Cambiar de bash a zsh
```console
sudo chsh $USER -s /bin/zsh;
sudo chsh root -s /bin/zsh;
```

Hacer un relog pulsando Super + X y despues L 