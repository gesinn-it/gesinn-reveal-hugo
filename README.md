# gesinn-reveal-hugo
A Hugo theme for [Reveal.js](https://revealjs.com/) with which you can turn any properly-formatted Hugo content into a HTML presentation.

## Example
Using reveal-hugo, presentations with multiple slides can be created with just one markdown file, like so:

```
+++
title = "How to say hello"
+++

# English
Hello.

---

# Français
Salut.

---

# Español
Hola.
```
Just use `---` surrounded by blank lines to split content into different slides.


## Documentation

Visit [reveal-hugo.dzello](https://reveal-hugo.dzello.com/#/) to see a presentation created with this theme and learn about all of the different functionality available to you.

## Installation

To start, install [Hugo](https://gohugo.io/installation/) and create a new Hugo site:

```
hugo new site my-presentation
```
Change into the directory of the new site:

```
cd my-presentation
```

Initialize a git repository:

```
git init
```

### Get the reveal-hugo theme

#### Method 1 (recommended): use theme as hugo module
Turn your new skeleton site into a hugo module by issuing this command from site root:
```
hugo mod init github.com/me/my-presentation
```

* Declare the reveal-hugo theme module as a dependency of your site:
```
hugo mod get github.com/joshed-io/reveal-hugo
```

Open `hugo.toml` and add the following line:
```
theme = ["github.com/joshed-io/reveal-hugo"]
```

#### Method 2 (traditional): use theme as git submodule
Add the `reveal-hugo` theme as a submodule in the themes directory:
```
git submodule add git@github.com:joshed-io/reveal-hugo.git themes/reveal-hugo
```

Open `hugo.toml` and add the following line:
```
theme = ["reveal-hugo"]
```

### Configure your presentation
Add some more contents to your `hugo.toml`:
```
[markup.goldmark.renderer]
unsafe = true

[outputFormats.Reveal]
baseName = "index"
mediaType = "text/html"
isHTML = true
```
This tells Hugo to use the reveal-hugo theme and it registers a new output format called "Reveal".

Next, create a file in `content/_index.md` and add the following:
```
+++
title = "My presentation"
outputs = ["Reveal"]
+++

# Hello world!

This is my first slide.
```

Back on the command line, run:
```
$ hugo server
```

Navigate to http://localhost:1313/ and you should see your presentation.

To add more slides, just add content to `_index.md` or create new markdown files in `content/home`. Remember that each slide must be separated by `---` with blank lines above and below.

## Run

To be able to serve the presentation locally use:
```
make up
```

To be able to serve the presentation in a Docker container use:
```
make docker-up
```

## Available _make_ commands
Find all available commands in Makefile. Note, that multiple targets can be given. Especially, the following could be handy:

| Command      | Purpose                                     | Destructive? | Duration |
|--------------|---------------------------------------------|--------------|----------|
| `make up` | Serve the presentation locally | no |
| `make docker-up` | Serve the presentation in a Docker container | no |
| `make clean` | Clean up build artifacts | no |
| `make show-logs` | Displays log output from services. | no
| `make help` | Show this help message | no

To be able to stop and exit presentation use this shortcut:
```
ctrl + c
```

This will stop the service and remove the container if `docker-up` is used.
