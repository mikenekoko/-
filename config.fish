# activatorにPATHを通す
set PATH /home/yourname/activator-1.3.10-minimal/bin $PATH

# lsの色を見やすく変更
if test ! -e ~/.dircolors/dircolors.ansi-dark
  git clone https://github.com/seebi/dircolors-solarized.git ~/.dircolors
end
eval (dircolors -c ~/.dircolors/dircolors.ansi-dark)

set fish_greeting "🐟🐠🐡 oh-my-fish! Welcome to mikeneko!! 🐳🐬🦀"
