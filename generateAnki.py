import genanki, os, sys, random
from natsort import natsorted

# RELEVANT LINKS
# https://github.com/kerrickstaley/genanki

model_id = random.randrange(1 << 30, 1 << 31)
deck_id = random.randrange(1 << 30, 1 << 31)

print('Creating Anki model...')
my_model = genanki.Model(
  model_id,
  'Sheet Music',
  fields = [
    { 'name': 'Score' },
    { 'name': 'EasyScore' },
    { 'name': 'Music' },
  ],
  templates = [{
    'name': 'Card 1',
    'qfmt': '<div class="score">{{Score}}</div>',
    'afmt': '<div class="easy-score">{{EasyScore}}</div><br>{{Music}}',
  }, ],
  css = '@import url(_base.css); @import url(_sheet-music.css);',
)

print('Creating Anki deck and invoking package...')
my_deck = genanki.Deck(deck_id, 'Sight Reading')
my_package = genanki.Package(my_deck)

my_package.media_files = []
folderName = sys.argv[1]

fileNames = natsorted(filter(lambda s: '.png' in s, os.listdir('output')))
fileNames.insert(0, fileNames.pop())

# Take the file names, split them as two separate arrays
# then combine (zip) them into the same array as a pair
# for processing
fileNamePairs = zip(fileNames[::2], fileNames[1::2])

# print(*fileNamePairs, sep = ", ")

for scoreFileName, easyScoreFileName in fileNamePairs:
  wavFileName = easyScoreFileName.split('.')[0] + '.wav'
  imgTag = '<img src="{0}">'
  my_note = genanki.Note(
    model = my_model,
    fields = [
      imgTag.format(scoreFileName),
      imgTag.format(easyScoreFileName),
      '[sound:{0}]'.format(wavFileName),
    ]
  )
  my_deck.add_note(my_note)

  my_package.media_files.extend([
    '{0}/{1}'.format('output', scoreFileName),
    '{0}/{1}'.format('output', easyScoreFileName),
    '{0}/{1}'.format('output', wavFileName),
  ])

print('Creating Anki package file...')
my_package.write_to_file('{0}.apkg'.format(folderName))
print('{0}.apkg created.'.format(folderName))
