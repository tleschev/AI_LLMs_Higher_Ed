# Wiki IA & LLMs

Des ressources recueilles cette années sur l'usage des IAs et des LLMs dans l'enseignement supérieur, pour les étudiant·e·s comme pour les équipes. 

## Contenu

Ce Wiki est organisé en quatre sections principales :

* Etudiant·e·s : Ressources pour les étudiant·e·s.
* Enseignant·e·s : Ressources pour les enseignant·e·s.
* Chercheur·e·s : Ressources pour les chercheur·e·s.
* Juridique : Ressources juridiques liées à l'utilisation des IA et LLMs.

## Utilisation 

Pour ajouter ou mettre à jour une ressource, il suffit de faire une *pull request* sur le dépôt GitHub du projet.

De manière plus simple, vous pouvez vous rendre sur le dépôt GitHub, cliquer sur le fichier que vous souhaitez modifier, puis cliquer sur l'icône de crayon pour éditer le fichier directement dans l'interface web. Une fois vos modifications effectuées, vous pouvez soumettre une *pull request* pour que les changements soient examinés et intégrés au projet.

Les fichiers des pages du Wiki sont des fichiers Markdown (.md) situés dans le dossier `docs/`. Le fichier `mkdocs.yml` à la racine du projet contient la configuration du site, y compris la structure de navigation. Il est important de suivre la structure définie dans ce fichier pour que les modifications soient correctement intégrées au site.

## Commandes Git et MkDocs

Pour modifier un dépôt GitHub, vous pouvez utiliser les commandes Git dans le terminal. Git est un système de contrôle de version qui permet de suivre les modifications apportées à un projet en collaborant avec d'autres personnes. 

Si vous voulez faire l'approche "terminal", les commandes Git à utiliser pour gérer les contributions sont les suivantes :

* `git clone [repo-url]` - Cloner le dépôt sur votre ordinateur.
* `git checkout -b [branch-name]` - Créer une nouvelle "branche" pour vos modifications.
* `git add [file-name]` - Ajouter les fichiers modifiés à l'index, qui permet de suivre les modifications que vous faites avant de les appliquer au site - "*commit*".
* `git commit -m "Your commit message"` - Appliquer les modifications avec un message de "*commit*" décrivant les changements.
* `git push origin [branch-name]` - Pousser les modifications vers le dépôt distant, depuis votre ordinateur au dépôt. Le site sera mise à jour après que les modifications soient validées. 

Pour installer git, vous pouvez suivre les instructions sur le site officiel : [Git - Installation](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

Les commandes suivantes sont utilisées pour gérer le projet avec MkDocs, un générateur de documentation statique :

* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs -h` - Print help message and exit.

## Fichiers

    mkdocs.yml    # Fichier de configuration, ne pas toucher.
    docs/
        index.md  # Accueil.
        et.md     # Les ressources pour les étudiant·e·s.
        ens.md    # Les ressources pour les enseignant·e·s.
        ch.md     # Les ressources pour les chercheur·e·s.
        jur.md    # Les ressources juridiques.
