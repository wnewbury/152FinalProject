import sys
#import util

# viterbiSearch
# Note: Followed Viterbi search pseudocode from Rabiner's "A Tutorial on Hidden Markov Models and Selected Applications
#       in Speech Recognition", as found at http://speech.bme.ogi.edu/tutordemos/nnet_recog/recog.html
#
# inputs:
#
# 	N is number of categories
# 	T is number of frames
# 	B[j][t] is matrix of category probabilities (neural net outputs)
# 		for j in range(N) and t in range(t)
# 	A[i][j] is matrix of probabilities of transitioning fro category i to category j
# 		for i in range(N) and j in range(N)
#
# outputs:
#
#	state[t] is phoneme at frame t in most probable sequence of phonemes
#		for t in range[T]
#
def viterbiSearch( N, T, B, A):

	# initialize values
	delta = [ [0 for t in range(T)] for n in range(N) ]
	psi = [ [0 for t in range(T)] for n in range(N) ]
	state = [0 for t in range(T)]

	for i in range(N):
		delta[i][0] = B[i][0]
		psi[i][0] = 0

	# main loop:
	# computes delta (scores) and psi (category values corresponding to best scores)
	# max score is probabiliy of being in state i and transitioning from state i to state j
	for t in range(1, T):
		for j in range(N):
			maxScore = -float("inf")
			maxIndex = 0
			for i in range(N):
				if (delta[i][t-1]*A[i][j]) > maxScore:
					maxScore = delta[i][t-1]*A[i][j]
					maxIndex = i

			delta[j][t] = maxScore*B[j][t]
			psi[j][t] = maxIndex

	# backtrack to find state (category) sequence
	maxScore = -float("inf")
	maxIndex = 0
	for i in range(N):
		if delta[i][T-1] > maxScore:
			maxScore = delta[i][T-1]
			maxIndex = i

	state[T-1] = maxIndex

	frames = range(T-1)
	reverseFrames = frames[::-1]
	for t in reverseFrames:
		state[t] = psi[state[t+1]][t+1]

	return state



# convertPhonemeSetToWord
#
# input: an array representing a list of phonemes in a word
# output: the word represented by the list of phonemes by doing a dictionary look up
#
def convertPhonemeSetToWord(phonemeSet):

	dictionary = getDictionary()

	workingSet = phonemeSet

	print "Working Set is: ", workingSet

	done = False

	while not(done):

		newSet = []
		#index = 0
		#while index < len(phonemeSet):
		# SAFTEY !!!!!!!!!!!!!!!!!!!!!!
		if workingSet[0] != 25:
			newSet.append(workingSet[0])
			#break

		for i in range(1, len(workingSet)):
			if workingSet[i] != workingSet[i-1]:
				if workingSet[i] != 25:
					newSet.append(workingSet[i])

		if len(newSet) == len(workingSet):
			done = True

		workingSet = newSet

	newPhonemeSet = tuple(workingSet)

	print "New Phoneme Set is: ", newPhonemeSet


	# check if word is in dictioary
	try:
		word = dictionary[newPhonemeSet]
		return word

	except:
		return None


def getDictionary():
	#dictionary = util.Counter()
	dictionary = { (18, 2, 29): "cat", (28, 0, 26, 24, 19, 17): "sharply" }

	print dictionary

	return dictionary


def getGrammarMatrix():

	# number of phonemes
	N = 36

	matrix = [ [0 for n in range(N)] for m in range(N) ]

	for i in range(N):
		matrix[i][i] = 1

	# sharply
	matrix[25][28] = 1
	matrix[28][0] = 1
	matrix[0][26] = 1
	matrix[26][24] = 1
	matrix[24][19] = 1
	matrix[19][17] = 1
	matrix[17][25] = 1
	matrix[0][25] = 1



	matrix[18][2] = 1
	matrix[2][29] = 1
	matrix[29][29] = 1



	'''


	matrix[25][25] = .5
	matrix[28][28] = .5
	matrix[0][0] = .5
	matrix[26][26] = .5
	matrix[24][24] = .5
	matrix[19][19] = .5
	matrix[17][17] = .5
	'''

	return matrix


def parseFileForMatrix(fileName, numFrames):

	N = 36
	matrix = [ [0 for t in range(numFrames)] for n in range(N) ]

	matrixFile = open(fileName, 'r')
	lines = (line.rstrip('\n') for line in matrixFile)

	frame = 0
	for line in lines:

		words = line.split()
		for i in range(len(words)):
			matrix[i][frame] = float(words[i])

		frame += 1

	matrixFile.close()

	return matrix


def parseFileForFrameNumber(fileName):

	frameFile = open(fileName, 'r')

	lines = (line.rstrip('\n') for line in frameFile)

	fileString = None
	for line in lines:
		words = line.split()
		fileString = words[0]
		break

	result = int(fileString)

	frameFile.close()

	return result

def main(argv):

	fileOneName = argv[0]
	fileTwoName = argv[1]

	# number of phonemes
	N = 36

	numFrames = parseFileForFrameNumber(fileTwoName)

	phonemeProbMatrix = parseFileForMatrix(fileOneName, numFrames)

	grammarMatrix = getGrammarMatrix()

	phonemeSet = viterbiSearch(N, numFrames, phonemeProbMatrix, grammarMatrix)

	word = convertPhonemeSetToWord(phonemeSet)

	if word == None:
		print "Highest probability word is not in dictionary!"

	else:
		print "Result is: ", word



if __name__ == "__main__":
    main(sys.argv[1:])
