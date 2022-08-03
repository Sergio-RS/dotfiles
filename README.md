<div align="center"> 
    <h1><strong>DOTFILES</strong></h1> 
</div>

<details open>
<summary><strong>&nbsp;I N S T A L L A T I O N &nbsp;🛠</strong></summary>
<br>

1. Instalar arcolinuxB bspwm

2. Desinstalar variety para que no cambie fondo de pantalla

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

</details>