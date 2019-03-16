![travis](https://travis-ci.org/VB10/manhang.svg?branch=master)
# manhang

Flutter project for 5kb challange.

## Getting Started

**Download or clone file and lib file must extract**

## Final App ShowCase

Manhang IOS             |  Manhang ANDROID
:-------------------------:|:-------------------------:
![Manhang IOS](https://github.com/VB10/manhang/blob/master/appflow/manhangIOS.gif?raw=true)  |  ![Manhang Androd](https://github.com/VB10/manhang/blob/master/appflow/manhangANDROID.gif?raw=true)

## Application Flow Chart
![manhang lifecycle](https://github.com/VB10/manhang/blob/master/appflow/applife.png?raw=true)


# Code Details

**QuestionVC**

1. getRnadomLanguage
/*
    Generate random language string.
    Split enum prefix ENUM.val
  */
2. convertList
/*
    character open in question text .
    return example _ a _ a
  */
3. endGame
/*
    The user will see final alert dialog.
    [true] param gif type.
  */
4. pigUnderLine
  // {questionWord} Convert underline text.

5. setLanguageWord
//set language arrays item.

6. userOnPress
  //control user input value for have any character in &&question word.


**QuestionModel**
 /*
    Generate question helper veriables.
  */

**tryOnPress**
   //The textedititng control components data
        //if user input have in language param  will return string so return null

**Game Screen State**
  /*
  Generate screen text inputText & questionWord
  */


