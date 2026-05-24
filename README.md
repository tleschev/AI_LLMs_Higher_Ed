# Ressources IA et LLMs dans l'Enseignement Supérieur

Des ressources recueillies sur l'usage des IAs et des LLMs dans l'enseignement supérieur, pour les étudiant·e·s comme pour les équipes.

Le **Site** : [tleschev.github.io/AI_LLMs_Higher_Ed](https://tleschev.github.io/AI_LLMs_Higher_Ed/)

## Contenu

Ce wiki est organisé en quatre sections principales :

- **Étudiant·e·s** : ressources pour les étudiant·e·s
- **Enseignant·e·s** : ressources pour les enseignant·e·s
- **Chercheur·e·s** : ressources pour les chercheur·e·s
- **Juridique** : ressources juridiques liées à l'utilisation des IA et LLMs

## Contribuer

Pour ajouter ou mettre à jour une ressource, vous pouvez :

- **Via l'interface GitHub** : cliquer sur le fichier à modifier, puis sur l'icône crayon, effectuer vos modifications et soumettre une *pull request*.
  
- **Via le terminal** :
  ```bash
  git clone https://github.com/tleschev/AI_LLMs_Higher_Ed.git
  git checkout -b ma-branche
  git add [fichier]
  git commit -m "description des modifications"
  git push origin ma-branche
  ```
  Puis ouvrir une *pull request* sur GitHub.

Les pages sont des fichiers Markdown (`.md`) dans le dossier `docs/`. La structure est définie dans `mkdocs.yml`.

## Structure des fichiers

```
mkdocs.yml        # Configuration du site
docs/
    index.md      # Accueil
    et.md         # Ressources pour les étudiant·e·s
    ens.md        # Ressources pour les enseignant·e·s
    ch.md         # Ressources pour les chercheur·e·s
    jur.md        # Ressources juridiques
```

## Technique

Site généré avec [MkDocs](https://www.mkdocs.org/) et le thème [simple-blog](https://pypi.org/project/mkdocs-simple-blog/). Claude Code (Sonnet 4.6) a été utilisé dans la mise en place des fichiers .css et .js, permettant de personnaliser le thème. Les ressources sont collectées et organisées manuellement. Hébergé sur GitHub Pages.
