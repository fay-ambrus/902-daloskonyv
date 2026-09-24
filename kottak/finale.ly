<<
  \new ChordNames {
    \chordmode {
      a1*2:m f1*2 c1 a1:m f1 f2 g2 a1*2:m a1:m f1*2 c1 a1:m f1 f2 g2 a1*2:m
    }
  }
  \new Staff \relative c' {
    \key a \minor
    \time 4/4
    \mark \markup {Intro}
    R1 | e'2.\prall r8 f16 e16 | d8 c16 b8 a16~a2 e16' g |
    g a8. a4 \grace g32 a8 a g\prall f16 e16~|~e2 r4 c16 b c d |
    e2. r16 e f e | d8 c16 b8 a16~a2 a16 b | c4 c b r16 b a g |
    g a2. r16 r8 | r1 |
    \mark \markup {Versszak}
    e16 e8 e16 e8 r16 e e8 e16 d8 c16 b8 | a4 r2. |
    a16' a8 a16 a8 a r8 a a16 g8 f16 | e2
  }
  \addlyrics {
    \repeat unfold 39 { \skip 1 }
    Ö -- reg le -- szek, vé -- nebb a té -- li nap -- nál,
    ked -- vem sö -- tét lesz és ha -- jam fe -- hér.
    %S mint a csitult patak a torkolatnál,
    %lankadt szívemben meglassul a vér.
  }
  
>>