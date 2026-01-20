#import "template.typ": *

#show: resume.with(
  firstname: "Adam",
  lastname: "Carrez",
  actual: "Computer Sience Student",
  picture: "public.png",
  side:
    [
      = Contact

      #contact_entries(
        (
          emoji.mail : link("mailto:...")[nothing\@mail.fr],
          fa-github : link("https://github.com/Linghuun")[Linghuun],
          fa-discord : [pseudo]
        )
      )
    ]
)

nothing there

