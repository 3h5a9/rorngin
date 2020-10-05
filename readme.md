### Instruction

- Download the repo by clone it.

- Go inside the `rorngin` folder and open terminal.

- Run the following command.

### For Postgresql
****
    `rails new yourappname -d postgresql -m railsngin.rb`


### Update routes.rb
****
    namespace :admin do
      get 'dashboard', to: 'dashboard#index'
    end

### Update Webpacker file
****
from the config folder go to `webpacker.yml` file 
and find out this following line

  #### Extract and emit a css file
  `extract_css: false`

  change it to 

  `extract_css: true`

  and save the file


### Run server
  As foreman is already added into our file we can run either 

  `rails s` 
  
  or 
  
  `foreman start` 

****

  `rails s` 
  is going to shart the server on localhost with port 3000 as follows

  `localhost:3000`
  
  or
  
  `127.0.0.1:3000`

****

  `forman start` 
  will srart run the server on localhost with port 5000 as follows

  `localhost:5000`
  
  or
  
  `127.0.0.1:5000`

### Included
---
- Latest Bootstrap Version [4.5.0]
- Fontawesome 5 
- Jquery
- popper js
- Foreman