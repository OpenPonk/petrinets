openssl aes-256-cbc -K $encrypted_66bacb1c7d24_key -iv $encrypted_66bacb1c7d24_iv -in .ssh/id_petrinets_travis.enc -out .ssh/id_petrinets_travis -d
chmod 0400 .ssh/id_petrinets_travis
eval $(ssh-agent -s)
ssh-add .ssh/id_petrinets_travis