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

3. Poner la ruta del nuevo wallpaper en .config/bspwm/autostart.sh. Por ejemplo:
```console
feh --bg-fill $HOME/.config/bspwm/sunset-mountain.jpg &
```

4. Instalar chrome con yay y ponerlo como navegador predeterminado
```console
yay -S google-chrome;
export BROWSER="";
xdg-settings set default-web-browser google-chrome.desktop
```

</details>