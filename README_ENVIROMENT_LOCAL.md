# CHALLENGE_OMTHIRTY

# Instalação ASDF:
 - **Obs1:** caso não possua já instalado o asdf, realize a instalação abaixo, executando no terminal:
  - git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.1
  - asdf info
  - asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
 - **Obs2:** Instale os pacotes abaixo para o ruby:
  - sudo apt install build-essential
  - sudo apt install libssl-dev libffi-dev libncurses5-dev zlib1g zlib1g-dev libreadline-dev libbz2-dev libsqlite3-dev make gcc
  - sudo apt-get install -y libpq-dev
  - sudo apt-get install postgresql postgresql-contrib

 - **Obs3:** Instale os pacotes abaixo para o ruby:
  - ASDF_RUBY_BUILD_VERSION=master asdf install ruby 3.2.0

- **Obs2:** escreve via echo para o bashrc conforme abaixo:
  - echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
  - echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
  - source ~/.bashrc

- **Obs3:** caso possua instalado o zshrc,escreve via echo para o zshrc conforme abaixo:
  - echo -e '\n. $HOME/.asdf/asdf.sh' >> zshrc
  - echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> zshrc
  - source ~/.zshrc
  
- **Obs4:** após concluída a instalação do asdf, instale a versão abaixo:
  - asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
  - asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

 # Clonar projeto:
 - git clone https://github.com/sanchojuniorce/challenge_omthirty.git
 - cd challenge_omthirty
 
 - **Obs1:** execute as instalações das Gems e Yarn:
 - asdf install nodejs 16.10.0
 - asdf install ruby 3.2.0
 - asdf global ruby 3.2.0
 - bundle install 
 - yarn install
# Started project
 - rails db:create 
 # Obs: Ao criar o banco acesse via pgadmin, acesse o banco challenge_omthirty
 - rails db:migrate
 - rails s