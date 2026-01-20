#import "template.typ": *

#show: resume.with(
  firstname: "Adam",
  lastname: "Carrez",
  actual: "Computer Sience Student",
  picture: "public.png",
  side:
    [

      #entry(
        title: "Contact",
        body: contact_entries(
        (
          emoji.mail : link("mailto:...")[nothing\@mail.fr],
          fa-github : link("https://github.com/Linghuun")[Linghuun],
          fa-discord : [pseudo]
        )
      )
      )

    ]

      
)
#entry(
  title: "Education",
  bg_color: rgb("#AEC6CF").lighten(85%),
  title_bg_color: rgb("#AEC6CF").lighten(85%),
  body:
  [
    #education_entries(
      (
        (
          date: "2025 - EOF",
          school: "School A",
          city : "Somewhere",
          formation: "Computer Science", 
          body :
            [
            - First-Year Modules : _Some modules_
            ]
        ),
        (
          date: "2023 - 2025",
          school: "School B",
          city : "Somewhere",
          formation: "CPGE", 
          body :
            [
              - TIPE : \<subject>
            ]
        ),
        (
          date: "2022 - 2023",
          school: "School C",
          city : "Somewhere",
          formation: "Baccalauréat général", 
          body :
            [
            - _Some modules_
            - _Some Honors_
            ]
        ),
      )
    )
  ]
)

nothing there

