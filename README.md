These are my Vim configuration files and plugins. This is a very python oriented setting. I primarily code in Python and at times a bit of JavaScript. These files are constantly evolving, so please feel free to comment on my choices.

Most of the plugins are done using Pathogen(including itself). The non pathogen plugins are found in the plugin directory. Currently these are the plugins in the plugin directory:

*colorx.vim - this is used to launch the colorpicker in Mac*  
*hexHighlight.vim - this is used to display the actual color of a hex.*  

My .vimrc file is constantly being updated. Hope I remember to commit the changes. I have tried to comment where ever necessary. There is a much modified version of the colour scheme clouds. I have called it cloudsxterm. It works on terminal and gui.

###Mappings for various commands

The leader is set to , 
| Mapping           |  Description                                   | 
|:------------------|:-----------------------------------------------|
| CTRL+n            |  toggles NERDTree Explorer                     |
| <leader>p         |  opens Google Chrome in Mac                    |
| <leader>md        |  opens Mou in Mac                              |
| CDM+i             |  opens iTerm                                   |
| <leader>nn        |  next buffer                                   |
| <leader>nb        |  previous buffer                               |
| <leader>g         |  Toggles Gundo                                 |
| <leader>j         |  Jump to definition using Rope                 |
| CTRL+j            |  Jump to definition using Rope                 |
| F4                |  Tlist toggle                                  |
| <leader>t         |  toggles CommandT plugin                       |
| CMD+t             |  toggles CommandT plugin                       |
| CMD+/             |  comments line                                 |
| ;;                |  Esc                                           |
| <leader>x         |  closes current window                         |
| CTRL+d            |  inserts python pdb.set_trace() in the code    |

