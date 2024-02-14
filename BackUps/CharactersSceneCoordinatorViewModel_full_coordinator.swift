{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;\f1\fnil\fcharset0 Menlo-Bold;}
{\colortbl;\red255\green255\blue255;\red124\green181\blue84;\red13\green13\blue14;\red255\green255\blue255;
\red252\green107\blue170;\red192\green138\blue255;\red93\green216\blue255;\red164\green251\blue230;\red66\green184\blue224;
\red222\green193\blue255;\red172\green240\blue123;\red114\green191\blue174;}
{\*\expandedcolortbl;;\csgenericrgb\c48672\c70957\c33070;\csgenericrgb\c4979\c4975\c5578;\csgenericrgb\c100000\c100000\c100000;
\csgenericrgb\c98896\c42114\c66499;\csgenericrgb\c75482\c53948\c99907;\csgenericrgb\c36471\c84706\c100000;\csgenericrgb\c64402\c98353\c90184;\csgenericrgb\c25859\c71980\c87708;
\csgenericrgb\c87028\c75839\c99946;\csgenericrgb\c67451\c94118\c48235;\csgenericrgb\c44848\c74872\c68231;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab593
\pard\tx593\pardeftab593\partightenfactor0

\f0\fs24 \cf2 \cb3 //\cf4 \
\cf2 //  CharactersSceneCoordinatorViewModel.swift\cf4 \
\cf2 //  TheStartWarsGuide\cf4 \
\cf2 //\cf4 \
\cf2 //  Created by Gonzalo.Giampietri on 12/02/2024.\cf4 \
\cf2 //\cf4 \
\

\f1\b \cf5 import
\f0\b0 \cf4  SwiftUI\

\f1\b \cf5 import
\f0\b0 \cf4  Observation\
\
\cf6 @Observable\cf4 \

\f1\b \cf5 final
\f0\b0 \cf4  
\f1\b \cf5 class
\f0\b0 \cf4  \cf7 CharactersSceneCoordinatorViewModel\cf4 : \cf8 CharactersSceneCoordinatorViewModelProtocol\cf4  \{\
    
\f1\b \cf5 typealias
\f0\b0 \cf4  \cf7 PushItem\cf4  = \cf8 CharactersScenePushNavigationType\cf4 \
    
\f1\b \cf5 typealias
\f0\b0 \cf4  \cf7 SheetItem\cf4  = \cf8 CharactersSceneSheetNavigationType\cf4 \
    
\f1\b \cf5 typealias
\f0\b0 \cf4  \cf7 FullScreenItem\cf4  = \cf8 CharactersSceneFullScreenNavigationType\cf4 \
    \
    
\f1\b \cf5 var
\f0\b0 \cf4  \cf9 navigationPath\cf4  = \cf10 NavigationPath\cf4 ()\
    
\f1\b \cf5 var
\f0\b0 \cf4  \cf9 sheetItem\cf4 : \cf8 CharactersSceneSheetNavigationType\cf4 ?\
    
\f1\b \cf5 var
\f0\b0 \cf4  \cf9 fullScreenItem\cf4 : \cf8 CharactersSceneFullScreenNavigationType\cf4 ?\
   \
    \cf2 //
\f1\b \cf11 MARK: Binding
\f0\b0 \cf4 \
    
\f1\b \cf5 var
\f0\b0 \cf4  \cf9 navigationPathBinding\cf4 : \cf10 Binding\cf4 <\cf10 NavigationPath\cf4 > \{\
        \cf10 Binding\cf4 (\cf6 get\cf4 : \{ 
\f1\b \cf5 self
\f0\b0 \cf4 .\cf12 navigationPath\cf4  \},\
                \cf6 set\cf4 : \{ 
\f1\b \cf5 self
\f0\b0 \cf4 .\cf12 navigationPath\cf4  = $0 \})\
    \}\
    \
    
\f1\b \cf5 var
\f0\b0 \cf4  \cf9 sheetItemBinding\cf4 : \cf10 Binding\cf4 <\cf8 SheetItem\cf4 ?> \{\
        \cf10 Binding\cf4 (\cf6 get\cf4 : \{ 
\f1\b \cf5 self
\f0\b0 \cf4 .\cf12 sheetItem\cf4  \},\
                \cf6 set\cf4 : \{ 
\f1\b \cf5 self
\f0\b0 \cf4 .\cf12 sheetItem\cf4  = $0 \})\
    \}\
    \
    
\f1\b \cf5 var
\f0\b0 \cf4  \cf9 fullScreenItemBinding\cf4 : \cf10 Binding\cf4 <\cf8 FullScreenItem\cf4 ?> \{\
        \cf10 Binding\cf4 (\cf6 get\cf4 : \{ 
\f1\b \cf5 self
\f0\b0 \cf4 .\cf12 fullScreenItem\cf4  \},\
                \cf6 set\cf4 : \{ 
\f1\b \cf5 self
\f0\b0 \cf4 .\cf12 fullScreenItem\cf4  = $0 \})\
    \}\
    \
    \cf2 //
\f1\b \cf11 MARK: Navigation methods
\f0\b0 \cf4 \
    
\f1\b \cf5 func
\f0\b0 \cf4  \cf9 push\cf4 (\cf9 _\cf4  item: \cf8 PushItem\cf4 ) \{\
        
\f1\b \cf5 self
\f0\b0 \cf4 .\cf12 navigationPath\cf4 .\cf6 append\cf4 (item)\
    \}\
    \
    
\f1\b \cf5 func
\f0\b0 \cf4  \cf9 present\cf4 (\cf9 _\cf4  item: \cf8 SheetItem\cf4 ) \{\
        
\f1\b \cf5 self
\f0\b0 \cf4 .\cf12 sheetItem\cf4  = item\
    \}\
    \
    
\f1\b \cf5 func
\f0\b0 \cf4  \cf9 present\cf4 (\cf9 _\cf4  item: \cf8 FullScreenItem\cf4 ) \{\
        
\f1\b \cf5 self
\f0\b0 \cf4 .\cf12 fullScreenItem\cf4  = item\
    \}\
    \
    
\f1\b \cf5 func
\f0\b0 \cf4  \cf9 pop\cf4 () \{\
        
\f1\b \cf5 guard
\f0\b0 \cf4  !\cf12 navigationPath\cf4 .\cf6 isEmpty\cf4  
\f1\b \cf5 else
\f0\b0 \cf4  \{ 
\f1\b \cf5 return
\f0\b0 \cf4  \}\
        
\f1\b \cf5 self
\f0\b0 \cf4 .\cf12 navigationPath\cf4 .\cf6 removeLast\cf4 ()\
    \}\
    \
    
\f1\b \cf5 func
\f0\b0 \cf4  \cf9 popToRoot\cf4 () \{\
        
\f1\b \cf5 guard
\f0\b0 \cf4  !\cf12 navigationPath\cf4 .\cf6 isEmpty\cf4  
\f1\b \cf5 else
\f0\b0 \cf4  \{ 
\f1\b \cf5 return
\f0\b0 \cf4  \}\
        
\f1\b \cf5 self
\f0\b0 \cf4 .\cf12 navigationPath\cf4 .\cf6 removeLast\cf4 (\cf12 navigationPath\cf4 .\cf6 count\cf4 )\
    \}\
    \
    
\f1\b \cf5 func
\f0\b0 \cf4  \cf9 dismissSheet\cf4 () \{\
        
\f1\b \cf5 guard
\f0\b0 \cf4  \cf12 sheetItem\cf4  != 
\f1\b \cf5 nil
\f0\b0 \cf4  
\f1\b \cf5 else
\f0\b0 \cf4  \{ 
\f1\b \cf5 return
\f0\b0 \cf4  \}\
        
\f1\b \cf5 self
\f0\b0 \cf4 .\cf12 sheetItem\cf4  = 
\f1\b \cf5 nil
\f0\b0 \cf4 \
    \}\
    \
    
\f1\b \cf5 func
\f0\b0 \cf4  \cf9 dismissFullScreen\cf4 () \{\
        
\f1\b \cf5 guard
\f0\b0 \cf4  \cf12 fullScreenItem\cf4  != 
\f1\b \cf5 nil
\f0\b0 \cf4  
\f1\b \cf5 else
\f0\b0 \cf4  \{ 
\f1\b \cf5 return
\f0\b0 \cf4  \}\
        
\f1\b \cf5 self
\f0\b0 \cf4 .\cf12 fullScreenItem\cf4  = 
\f1\b \cf5 nil
\f0\b0 \cf4 \
    \}\
    \
    \cf2 //
\f1\b \cf11 MARK: Building methods
\f0\b0 \cf4 \
    \cf10 @ViewBuilder\cf4  
\f1\b \cf5 func
\f0\b0 \cf4  \cf9 build\cf4 (\cf9 for\cf4  item: \cf8 PushItem\cf4 ) -> 
\f1\b \cf5 some
\f0\b0 \cf4  \cf10 View\cf4  \{\
        
\f1\b \cf5 switch
\f0\b0 \cf4  item \{\
        
\f1\b \cf5 case
\f0\b0 \cf4  .\cf12 list\cf4 :\
            \cf8 CharactersSceneBuilder\cf4 .\cf12 shared\cf4 .\cf12 buildListView\cf4 ()\
        
\f1\b \cf5 case
\f0\b0 \cf4  .\cf12 detail\cf4 :\
            \cf2 //
\f1\b \cf11 TODO: Inject dependencies. Declare it in PushItem enum
\f0\b0 \cf4 \
            \cf8 CharactersSceneBuilder\cf4 .\cf12 shared\cf4 .\cf12 buildCharacterDetailView\cf4 ()\
        \}\
    \}\
    \
    \cf10 @ViewBuilder\cf4  
\f1\b \cf5 func
\f0\b0 \cf4  \cf9 build\cf4 (\cf9 for\cf4  item: \cf8 SheetItem\cf4 ) -> 
\f1\b \cf5 some
\f0\b0 \cf4  \cf10 View\cf4  \{\
        
\f1\b \cf5 switch
\f0\b0 \cf4  item \{\
        
\f1\b \cf5 case
\f0\b0 \cf4  .\cf12 sheet1\cf4 :\
            \cf8 CharactersSceneBuilder\cf4 .\cf12 shared\cf4 .\cf12 buildListView\cf4 ()\
        
\f1\b \cf5 case
\f0\b0 \cf4  .\cf12 sheet2\cf4 :\
            \cf8 CharactersSceneBuilder\cf4 .\cf12 shared\cf4 .\cf12 buildCharacterDetailView\cf4 ()\
        \}\
    \}\
    \
    \cf10 @ViewBuilder\cf4  
\f1\b \cf5 func
\f0\b0 \cf4  \cf9 build\cf4 (\cf9 for\cf4  item: \cf8 FullScreenItem\cf4 ) -> 
\f1\b \cf5 some
\f0\b0 \cf4  \cf10 View\cf4  \{\
        
\f1\b \cf5 switch
\f0\b0 \cf4  item \{\
        
\f1\b \cf5 case
\f0\b0 \cf4  .\cf12 full1\cf4 :\
            \cf8 CharactersSceneBuilder\cf4 .\cf12 shared\cf4 .\cf12 buildListView\cf4 ()\
        
\f1\b \cf5 case
\f0\b0 \cf4  .\cf12 full2\cf4 :\
            \cf8 CharactersSceneBuilder\cf4 .\cf12 shared\cf4 .\cf12 buildCharacterDetailView\cf4 ()\
        \}\
    \}\
\}\
}