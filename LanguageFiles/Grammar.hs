{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}
#if __GLASGOW_HASKELL__ >= 710
{-# OPTIONS_GHC -XPartialTypeSignatures #-}
#endif
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6

happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfc\xff\x9f\x04\x00\xba\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\xff\x5f\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\xc0\xff\xff\x09\x00\xa0\x11\x00\x00\x00\x00\x00\x00\x00\xfc\xff\x9f\x00\x00\x1a\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\xff\xff\x09\x00\xa0\x11\xf0\xff\x7f\x02\x00\x68\x04\xfc\xff\x9f\x00\x00\x1a\x01\x00\x00\x00\x00\x00\x00\xc0\xff\xff\xc9\x00\xa0\x1b\x00\x00\x00\xc4\xff\x17\x00\xfc\xff\x9f\x00\x00\x1a\x01\xff\xff\x27\x00\x80\x46\xc0\xff\xff\x09\x00\xa0\x11\xf0\xff\x7f\x02\x00\x68\x04\xfc\xff\x9f\x00\x00\x1a\x01\xff\xff\x27\x00\x80\x46\xc0\xff\xff\x09\x00\xa0\x11\x00\x00\x20\x00\x00\x00\x00\xfc\xff\x9f\x00\x00\x1a\x01\xff\xff\x27\x00\x80\x46\xc0\xff\xff\x09\x00\xa0\x11\xf0\xff\x7f\x02\x00\x68\x04\xfc\xff\x9f\x00\x00\x1a\x01\xff\xff\x27\x00\x80\x46\xc0\xff\xff\x09\x00\xa0\x11\xf0\xff\x7f\x02\x00\x68\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf0\xff\x7f\x02\x00\x68\x04\xfc\xff\x9f\x00\x00\x1a\x01\xff\xff\x27\x00\x80\x46\xc0\xff\xff\x09\x00\xa0\x11\xf0\xff\x7f\x02\x00\x68\x04\xfc\xff\x9f\x00\x00\x1a\x01\xff\xff\x27\x00\x80\x46\xc0\xff\xff\x09\x00\xa0\x11\xf0\xff\x7f\x02\x00\x68\x04\xfc\xff\x9f\x00\x00\x1a\x01\xff\xff\x27\x00\x80\x46\xc0\xff\xff\x09\x00\xa0\x11\xf0\xff\x7f\x02\x00\x68\x04\xfc\xff\x9f\x00\x00\x1a\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xff\x4f\x00\x00\x00\x00\xc0\xff\x11\x00\x00\x00\x00\xf0\x3f\x04\x00\x00\x00\x00\xfc\x07\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x18\x04\x00\x00\x00\x00\x00\x06\x01\x00\x00\x00\x00\xef\x41\x00\x00\x00\x00\x00\x78\x10\x00\x00\x00\x00\x00\x1e\x04\x00\x00\x00\x00\x80\x07\x01\x00\x00\x00\x00\xe0\x41\x00\x00\x00\x00\xc4\xff\x17\x00\x00\x00\x00\xf3\xff\x05\x00\x00\x00\x80\xfc\x7f\x01\x00\x00\x00\x20\xff\x5f\x00\x00\x00\x00\xc4\xff\x17\x00\x00\x00\x00\xf2\xff\x05\x00\x00\x00\x40\xfc\x7f\x01\x00\x00\x00\x10\xff\x5f\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\xf1\xff\x05\x00\x00\x00\x40\xfc\x7f\x01\x00\x00\x00\x10\xff\x5f\x00\x00\x00\x00\xc4\xff\x17\x00\x00\x00\x00\xf2\xff\x05\x00\x00\x00\x80\xfc\x7f\x01\x00\x00\x00\x00\xff\x5f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\xfc\x7f\x01\x00\x00\x00\x10\xff\x5f\x00\x00\x00\x00\xc4\xff\x17\x00\xfc\xff\x9f\x04\x00\xba\x01\xff\xff\x27\x01\x80\x6e\x00\x00\x00\x00\x00\x00\x00\xf0\xff\x7f\x02\x00\x68\x04\xfc\xff\x9f\x00\x00\x1a\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\xff\xff\x09\x00\xa0\x11\xf0\xff\x7f\x02\x00\x68\x04\x00\x00\x00\x00\x00\x00\x00\xff\xff\x27\x00\x80\x46\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc4\xff\x17\x00\x00\x00\x00\xf1\xff\x05\x00\x00\x00\x80\xfc\x7f\x01\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\xf2\xff\x05\x00\x00\x00\x80\xfc\x7f\x01\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\xfc\xff\x9f\x04\x00\xba\x01\xff\xff\x27\x00\x80\x46\xc0\xff\xff\x09\x00\xa0\x11\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x80\xfc\x7f\x01\x00\x00\x00\x10\xff\x5f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xff\xff\x27\x00\x80\x46\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc4\xff\x17\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","StatementList","Statement","exp","Int","Tile","read","write","stack","alternate","rotate","scale","reflectX","reflectY","make_tile","getCol","getRow","blank","neg","modify","access","int","var","';'","'='","'('","')'","','","'{'","'}'","'<'","'>'","'>='","'<='","'=='","'+'","'-'","'*'","'/'","'&&'","'||'","'&'","'|'","'!'","'%'","bool","print","if","else","while","string","%eof"]
        bit_start = st Prelude.* 54
        bit_end = (st Prelude.+ 1) Prelude.* 54
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..53]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (4#) = happyGoto action_2
action_0 x = happyTcHack x happyReduce_1

action_1 x = happyTcHack x happyFail (happyExpListPerState 1)

action_2 (7#) = happyShift action_5
action_2 (8#) = happyShift action_6
action_2 (9#) = happyShift action_7
action_2 (10#) = happyShift action_8
action_2 (11#) = happyShift action_9
action_2 (12#) = happyShift action_10
action_2 (13#) = happyShift action_11
action_2 (14#) = happyShift action_12
action_2 (15#) = happyShift action_13
action_2 (16#) = happyShift action_14
action_2 (17#) = happyShift action_15
action_2 (18#) = happyShift action_16
action_2 (19#) = happyShift action_17
action_2 (20#) = happyShift action_18
action_2 (21#) = happyShift action_19
action_2 (22#) = happyShift action_20
action_2 (23#) = happyShift action_21
action_2 (24#) = happyShift action_22
action_2 (25#) = happyShift action_23
action_2 (28#) = happyShift action_24
action_2 (31#) = happyShift action_25
action_2 (46#) = happyShift action_26
action_2 (48#) = happyShift action_27
action_2 (49#) = happyShift action_28
action_2 (50#) = happyShift action_29
action_2 (52#) = happyShift action_30
action_2 (53#) = happyShift action_31
action_2 (54#) = happyAccept
action_2 (5#) = happyGoto action_3
action_2 (6#) = happyGoto action_4
action_2 x = happyTcHack x happyFail (happyExpListPerState 2)

action_3 x = happyTcHack x happyReduce_2

action_4 (26#) = happyShift action_56
action_4 (33#) = happyShift action_57
action_4 (34#) = happyShift action_58
action_4 (35#) = happyShift action_59
action_4 (36#) = happyShift action_60
action_4 (37#) = happyShift action_61
action_4 (38#) = happyShift action_62
action_4 (39#) = happyShift action_63
action_4 (40#) = happyShift action_64
action_4 (41#) = happyShift action_65
action_4 (42#) = happyShift action_66
action_4 (43#) = happyShift action_67
action_4 (44#) = happyShift action_68
action_4 (45#) = happyShift action_69
action_4 (47#) = happyShift action_70
action_4 x = happyTcHack x happyFail (happyExpListPerState 4)

action_5 (25#) = happyShift action_55
action_5 x = happyTcHack x happyFail (happyExpListPerState 5)

action_6 (25#) = happyShift action_54
action_6 x = happyTcHack x happyFail (happyExpListPerState 6)

action_7 (28#) = happyShift action_53
action_7 x = happyTcHack x happyFail (happyExpListPerState 7)

action_8 (28#) = happyShift action_52
action_8 x = happyTcHack x happyFail (happyExpListPerState 8)

action_9 (28#) = happyShift action_51
action_9 x = happyTcHack x happyFail (happyExpListPerState 9)

action_10 (28#) = happyShift action_50
action_10 x = happyTcHack x happyFail (happyExpListPerState 10)

action_11 (28#) = happyShift action_49
action_11 x = happyTcHack x happyFail (happyExpListPerState 11)

action_12 (28#) = happyShift action_48
action_12 x = happyTcHack x happyFail (happyExpListPerState 12)

action_13 (28#) = happyShift action_47
action_13 x = happyTcHack x happyFail (happyExpListPerState 13)

action_14 (28#) = happyShift action_46
action_14 x = happyTcHack x happyFail (happyExpListPerState 14)

action_15 (28#) = happyShift action_45
action_15 x = happyTcHack x happyFail (happyExpListPerState 15)

action_16 (28#) = happyShift action_44
action_16 x = happyTcHack x happyFail (happyExpListPerState 16)

action_17 (28#) = happyShift action_43
action_17 x = happyTcHack x happyFail (happyExpListPerState 17)

action_18 (28#) = happyShift action_42
action_18 x = happyTcHack x happyFail (happyExpListPerState 18)

action_19 (28#) = happyShift action_41
action_19 x = happyTcHack x happyFail (happyExpListPerState 19)

action_20 (28#) = happyShift action_40
action_20 x = happyTcHack x happyFail (happyExpListPerState 20)

action_21 (28#) = happyShift action_39
action_21 x = happyTcHack x happyFail (happyExpListPerState 21)

action_22 x = happyTcHack x happyReduce_8

action_23 (27#) = happyShift action_38
action_23 x = happyTcHack x happyReduce_9

action_24 (7#) = happyShift action_5
action_24 (8#) = happyShift action_6
action_24 (9#) = happyShift action_7
action_24 (10#) = happyShift action_8
action_24 (11#) = happyShift action_9
action_24 (12#) = happyShift action_10
action_24 (13#) = happyShift action_11
action_24 (14#) = happyShift action_12
action_24 (15#) = happyShift action_13
action_24 (16#) = happyShift action_14
action_24 (17#) = happyShift action_15
action_24 (18#) = happyShift action_16
action_24 (19#) = happyShift action_17
action_24 (20#) = happyShift action_18
action_24 (21#) = happyShift action_19
action_24 (22#) = happyShift action_20
action_24 (23#) = happyShift action_21
action_24 (24#) = happyShift action_22
action_24 (25#) = happyShift action_23
action_24 (28#) = happyShift action_24
action_24 (46#) = happyShift action_26
action_24 (48#) = happyShift action_27
action_24 (49#) = happyShift action_28
action_24 (53#) = happyShift action_31
action_24 (6#) = happyGoto action_37
action_24 x = happyTcHack x happyFail (happyExpListPerState 24)

action_25 (4#) = happyGoto action_36
action_25 x = happyTcHack x happyReduce_1

action_26 (7#) = happyShift action_5
action_26 (8#) = happyShift action_6
action_26 (9#) = happyShift action_7
action_26 (10#) = happyShift action_8
action_26 (11#) = happyShift action_9
action_26 (12#) = happyShift action_10
action_26 (13#) = happyShift action_11
action_26 (14#) = happyShift action_12
action_26 (15#) = happyShift action_13
action_26 (16#) = happyShift action_14
action_26 (17#) = happyShift action_15
action_26 (18#) = happyShift action_16
action_26 (19#) = happyShift action_17
action_26 (20#) = happyShift action_18
action_26 (21#) = happyShift action_19
action_26 (22#) = happyShift action_20
action_26 (23#) = happyShift action_21
action_26 (24#) = happyShift action_22
action_26 (25#) = happyShift action_23
action_26 (28#) = happyShift action_24
action_26 (46#) = happyShift action_26
action_26 (48#) = happyShift action_27
action_26 (49#) = happyShift action_28
action_26 (53#) = happyShift action_31
action_26 (6#) = happyGoto action_35
action_26 x = happyTcHack x happyFail (happyExpListPerState 26)

action_27 x = happyTcHack x happyReduce_44

action_28 (28#) = happyShift action_34
action_28 x = happyTcHack x happyFail (happyExpListPerState 28)

action_29 (28#) = happyShift action_33
action_29 x = happyTcHack x happyFail (happyExpListPerState 29)

action_30 (28#) = happyShift action_32
action_30 x = happyTcHack x happyFail (happyExpListPerState 30)

action_31 x = happyTcHack x happyReduce_45

action_32 (7#) = happyShift action_5
action_32 (8#) = happyShift action_6
action_32 (9#) = happyShift action_7
action_32 (10#) = happyShift action_8
action_32 (11#) = happyShift action_9
action_32 (12#) = happyShift action_10
action_32 (13#) = happyShift action_11
action_32 (14#) = happyShift action_12
action_32 (15#) = happyShift action_13
action_32 (16#) = happyShift action_14
action_32 (17#) = happyShift action_15
action_32 (18#) = happyShift action_16
action_32 (19#) = happyShift action_17
action_32 (20#) = happyShift action_18
action_32 (21#) = happyShift action_19
action_32 (22#) = happyShift action_20
action_32 (23#) = happyShift action_21
action_32 (24#) = happyShift action_22
action_32 (25#) = happyShift action_23
action_32 (28#) = happyShift action_24
action_32 (46#) = happyShift action_26
action_32 (48#) = happyShift action_27
action_32 (49#) = happyShift action_28
action_32 (53#) = happyShift action_31
action_32 (6#) = happyGoto action_105
action_32 x = happyTcHack x happyFail (happyExpListPerState 32)

action_33 (7#) = happyShift action_5
action_33 (8#) = happyShift action_6
action_33 (9#) = happyShift action_7
action_33 (10#) = happyShift action_8
action_33 (11#) = happyShift action_9
action_33 (12#) = happyShift action_10
action_33 (13#) = happyShift action_11
action_33 (14#) = happyShift action_12
action_33 (15#) = happyShift action_13
action_33 (16#) = happyShift action_14
action_33 (17#) = happyShift action_15
action_33 (18#) = happyShift action_16
action_33 (19#) = happyShift action_17
action_33 (20#) = happyShift action_18
action_33 (21#) = happyShift action_19
action_33 (22#) = happyShift action_20
action_33 (23#) = happyShift action_21
action_33 (24#) = happyShift action_22
action_33 (25#) = happyShift action_23
action_33 (28#) = happyShift action_24
action_33 (46#) = happyShift action_26
action_33 (48#) = happyShift action_27
action_33 (49#) = happyShift action_28
action_33 (53#) = happyShift action_31
action_33 (6#) = happyGoto action_104
action_33 x = happyTcHack x happyFail (happyExpListPerState 33)

action_34 (7#) = happyShift action_5
action_34 (8#) = happyShift action_6
action_34 (9#) = happyShift action_7
action_34 (10#) = happyShift action_8
action_34 (11#) = happyShift action_9
action_34 (12#) = happyShift action_10
action_34 (13#) = happyShift action_11
action_34 (14#) = happyShift action_12
action_34 (15#) = happyShift action_13
action_34 (16#) = happyShift action_14
action_34 (17#) = happyShift action_15
action_34 (18#) = happyShift action_16
action_34 (19#) = happyShift action_17
action_34 (20#) = happyShift action_18
action_34 (21#) = happyShift action_19
action_34 (22#) = happyShift action_20
action_34 (23#) = happyShift action_21
action_34 (24#) = happyShift action_22
action_34 (25#) = happyShift action_23
action_34 (28#) = happyShift action_24
action_34 (46#) = happyShift action_26
action_34 (48#) = happyShift action_27
action_34 (49#) = happyShift action_28
action_34 (53#) = happyShift action_31
action_34 (6#) = happyGoto action_103
action_34 x = happyTcHack x happyFail (happyExpListPerState 34)

action_35 x = happyTcHack x happyReduce_24

action_36 (7#) = happyShift action_5
action_36 (8#) = happyShift action_6
action_36 (9#) = happyShift action_7
action_36 (10#) = happyShift action_8
action_36 (11#) = happyShift action_9
action_36 (12#) = happyShift action_10
action_36 (13#) = happyShift action_11
action_36 (14#) = happyShift action_12
action_36 (15#) = happyShift action_13
action_36 (16#) = happyShift action_14
action_36 (17#) = happyShift action_15
action_36 (18#) = happyShift action_16
action_36 (19#) = happyShift action_17
action_36 (20#) = happyShift action_18
action_36 (21#) = happyShift action_19
action_36 (22#) = happyShift action_20
action_36 (23#) = happyShift action_21
action_36 (24#) = happyShift action_22
action_36 (25#) = happyShift action_23
action_36 (28#) = happyShift action_24
action_36 (31#) = happyShift action_25
action_36 (32#) = happyShift action_102
action_36 (46#) = happyShift action_26
action_36 (48#) = happyShift action_27
action_36 (49#) = happyShift action_28
action_36 (50#) = happyShift action_29
action_36 (52#) = happyShift action_30
action_36 (53#) = happyShift action_31
action_36 (5#) = happyGoto action_3
action_36 (6#) = happyGoto action_4
action_36 x = happyTcHack x happyFail (happyExpListPerState 36)

action_37 (29#) = happyShift action_101
action_37 (33#) = happyShift action_57
action_37 (34#) = happyShift action_58
action_37 (35#) = happyShift action_59
action_37 (36#) = happyShift action_60
action_37 (37#) = happyShift action_61
action_37 (38#) = happyShift action_62
action_37 (39#) = happyShift action_63
action_37 (40#) = happyShift action_64
action_37 (41#) = happyShift action_65
action_37 (42#) = happyShift action_66
action_37 (43#) = happyShift action_67
action_37 (44#) = happyShift action_68
action_37 (45#) = happyShift action_69
action_37 (47#) = happyShift action_70
action_37 x = happyTcHack x happyFail (happyExpListPerState 37)

action_38 (7#) = happyShift action_5
action_38 (8#) = happyShift action_6
action_38 (9#) = happyShift action_7
action_38 (10#) = happyShift action_8
action_38 (11#) = happyShift action_9
action_38 (12#) = happyShift action_10
action_38 (13#) = happyShift action_11
action_38 (14#) = happyShift action_12
action_38 (15#) = happyShift action_13
action_38 (16#) = happyShift action_14
action_38 (17#) = happyShift action_15
action_38 (18#) = happyShift action_16
action_38 (19#) = happyShift action_17
action_38 (20#) = happyShift action_18
action_38 (21#) = happyShift action_19
action_38 (22#) = happyShift action_20
action_38 (23#) = happyShift action_21
action_38 (24#) = happyShift action_22
action_38 (25#) = happyShift action_23
action_38 (28#) = happyShift action_24
action_38 (46#) = happyShift action_26
action_38 (48#) = happyShift action_27
action_38 (49#) = happyShift action_28
action_38 (53#) = happyShift action_31
action_38 (6#) = happyGoto action_100
action_38 x = happyTcHack x happyFail (happyExpListPerState 38)

action_39 (7#) = happyShift action_5
action_39 (8#) = happyShift action_6
action_39 (9#) = happyShift action_7
action_39 (10#) = happyShift action_8
action_39 (11#) = happyShift action_9
action_39 (12#) = happyShift action_10
action_39 (13#) = happyShift action_11
action_39 (14#) = happyShift action_12
action_39 (15#) = happyShift action_13
action_39 (16#) = happyShift action_14
action_39 (17#) = happyShift action_15
action_39 (18#) = happyShift action_16
action_39 (19#) = happyShift action_17
action_39 (20#) = happyShift action_18
action_39 (21#) = happyShift action_19
action_39 (22#) = happyShift action_20
action_39 (23#) = happyShift action_21
action_39 (24#) = happyShift action_22
action_39 (25#) = happyShift action_23
action_39 (28#) = happyShift action_24
action_39 (46#) = happyShift action_26
action_39 (48#) = happyShift action_27
action_39 (49#) = happyShift action_28
action_39 (53#) = happyShift action_31
action_39 (6#) = happyGoto action_99
action_39 x = happyTcHack x happyFail (happyExpListPerState 39)

action_40 (7#) = happyShift action_5
action_40 (8#) = happyShift action_6
action_40 (9#) = happyShift action_7
action_40 (10#) = happyShift action_8
action_40 (11#) = happyShift action_9
action_40 (12#) = happyShift action_10
action_40 (13#) = happyShift action_11
action_40 (14#) = happyShift action_12
action_40 (15#) = happyShift action_13
action_40 (16#) = happyShift action_14
action_40 (17#) = happyShift action_15
action_40 (18#) = happyShift action_16
action_40 (19#) = happyShift action_17
action_40 (20#) = happyShift action_18
action_40 (21#) = happyShift action_19
action_40 (22#) = happyShift action_20
action_40 (23#) = happyShift action_21
action_40 (24#) = happyShift action_22
action_40 (25#) = happyShift action_23
action_40 (28#) = happyShift action_24
action_40 (46#) = happyShift action_26
action_40 (48#) = happyShift action_27
action_40 (49#) = happyShift action_28
action_40 (53#) = happyShift action_31
action_40 (6#) = happyGoto action_98
action_40 x = happyTcHack x happyFail (happyExpListPerState 40)

action_41 (7#) = happyShift action_5
action_41 (8#) = happyShift action_6
action_41 (9#) = happyShift action_7
action_41 (10#) = happyShift action_8
action_41 (11#) = happyShift action_9
action_41 (12#) = happyShift action_10
action_41 (13#) = happyShift action_11
action_41 (14#) = happyShift action_12
action_41 (15#) = happyShift action_13
action_41 (16#) = happyShift action_14
action_41 (17#) = happyShift action_15
action_41 (18#) = happyShift action_16
action_41 (19#) = happyShift action_17
action_41 (20#) = happyShift action_18
action_41 (21#) = happyShift action_19
action_41 (22#) = happyShift action_20
action_41 (23#) = happyShift action_21
action_41 (24#) = happyShift action_22
action_41 (25#) = happyShift action_23
action_41 (28#) = happyShift action_24
action_41 (46#) = happyShift action_26
action_41 (48#) = happyShift action_27
action_41 (49#) = happyShift action_28
action_41 (53#) = happyShift action_31
action_41 (6#) = happyGoto action_97
action_41 x = happyTcHack x happyFail (happyExpListPerState 41)

action_42 (7#) = happyShift action_5
action_42 (8#) = happyShift action_6
action_42 (9#) = happyShift action_7
action_42 (10#) = happyShift action_8
action_42 (11#) = happyShift action_9
action_42 (12#) = happyShift action_10
action_42 (13#) = happyShift action_11
action_42 (14#) = happyShift action_12
action_42 (15#) = happyShift action_13
action_42 (16#) = happyShift action_14
action_42 (17#) = happyShift action_15
action_42 (18#) = happyShift action_16
action_42 (19#) = happyShift action_17
action_42 (20#) = happyShift action_18
action_42 (21#) = happyShift action_19
action_42 (22#) = happyShift action_20
action_42 (23#) = happyShift action_21
action_42 (24#) = happyShift action_22
action_42 (25#) = happyShift action_23
action_42 (28#) = happyShift action_24
action_42 (46#) = happyShift action_26
action_42 (48#) = happyShift action_27
action_42 (49#) = happyShift action_28
action_42 (53#) = happyShift action_31
action_42 (6#) = happyGoto action_96
action_42 x = happyTcHack x happyFail (happyExpListPerState 42)

action_43 (7#) = happyShift action_5
action_43 (8#) = happyShift action_6
action_43 (9#) = happyShift action_7
action_43 (10#) = happyShift action_8
action_43 (11#) = happyShift action_9
action_43 (12#) = happyShift action_10
action_43 (13#) = happyShift action_11
action_43 (14#) = happyShift action_12
action_43 (15#) = happyShift action_13
action_43 (16#) = happyShift action_14
action_43 (17#) = happyShift action_15
action_43 (18#) = happyShift action_16
action_43 (19#) = happyShift action_17
action_43 (20#) = happyShift action_18
action_43 (21#) = happyShift action_19
action_43 (22#) = happyShift action_20
action_43 (23#) = happyShift action_21
action_43 (24#) = happyShift action_22
action_43 (25#) = happyShift action_23
action_43 (28#) = happyShift action_24
action_43 (46#) = happyShift action_26
action_43 (48#) = happyShift action_27
action_43 (49#) = happyShift action_28
action_43 (53#) = happyShift action_31
action_43 (6#) = happyGoto action_95
action_43 x = happyTcHack x happyFail (happyExpListPerState 43)

action_44 (7#) = happyShift action_5
action_44 (8#) = happyShift action_6
action_44 (9#) = happyShift action_7
action_44 (10#) = happyShift action_8
action_44 (11#) = happyShift action_9
action_44 (12#) = happyShift action_10
action_44 (13#) = happyShift action_11
action_44 (14#) = happyShift action_12
action_44 (15#) = happyShift action_13
action_44 (16#) = happyShift action_14
action_44 (17#) = happyShift action_15
action_44 (18#) = happyShift action_16
action_44 (19#) = happyShift action_17
action_44 (20#) = happyShift action_18
action_44 (21#) = happyShift action_19
action_44 (22#) = happyShift action_20
action_44 (23#) = happyShift action_21
action_44 (24#) = happyShift action_22
action_44 (25#) = happyShift action_23
action_44 (28#) = happyShift action_24
action_44 (46#) = happyShift action_26
action_44 (48#) = happyShift action_27
action_44 (49#) = happyShift action_28
action_44 (53#) = happyShift action_31
action_44 (6#) = happyGoto action_94
action_44 x = happyTcHack x happyFail (happyExpListPerState 44)

action_45 (24#) = happyShift action_93
action_45 x = happyTcHack x happyFail (happyExpListPerState 45)

action_46 (7#) = happyShift action_5
action_46 (8#) = happyShift action_6
action_46 (9#) = happyShift action_7
action_46 (10#) = happyShift action_8
action_46 (11#) = happyShift action_9
action_46 (12#) = happyShift action_10
action_46 (13#) = happyShift action_11
action_46 (14#) = happyShift action_12
action_46 (15#) = happyShift action_13
action_46 (16#) = happyShift action_14
action_46 (17#) = happyShift action_15
action_46 (18#) = happyShift action_16
action_46 (19#) = happyShift action_17
action_46 (20#) = happyShift action_18
action_46 (21#) = happyShift action_19
action_46 (22#) = happyShift action_20
action_46 (23#) = happyShift action_21
action_46 (24#) = happyShift action_22
action_46 (25#) = happyShift action_23
action_46 (28#) = happyShift action_24
action_46 (46#) = happyShift action_26
action_46 (48#) = happyShift action_27
action_46 (49#) = happyShift action_28
action_46 (53#) = happyShift action_31
action_46 (6#) = happyGoto action_92
action_46 x = happyTcHack x happyFail (happyExpListPerState 46)

action_47 (7#) = happyShift action_5
action_47 (8#) = happyShift action_6
action_47 (9#) = happyShift action_7
action_47 (10#) = happyShift action_8
action_47 (11#) = happyShift action_9
action_47 (12#) = happyShift action_10
action_47 (13#) = happyShift action_11
action_47 (14#) = happyShift action_12
action_47 (15#) = happyShift action_13
action_47 (16#) = happyShift action_14
action_47 (17#) = happyShift action_15
action_47 (18#) = happyShift action_16
action_47 (19#) = happyShift action_17
action_47 (20#) = happyShift action_18
action_47 (21#) = happyShift action_19
action_47 (22#) = happyShift action_20
action_47 (23#) = happyShift action_21
action_47 (24#) = happyShift action_22
action_47 (25#) = happyShift action_23
action_47 (28#) = happyShift action_24
action_47 (46#) = happyShift action_26
action_47 (48#) = happyShift action_27
action_47 (49#) = happyShift action_28
action_47 (53#) = happyShift action_31
action_47 (6#) = happyGoto action_91
action_47 x = happyTcHack x happyFail (happyExpListPerState 47)

action_48 (7#) = happyShift action_5
action_48 (8#) = happyShift action_6
action_48 (9#) = happyShift action_7
action_48 (10#) = happyShift action_8
action_48 (11#) = happyShift action_9
action_48 (12#) = happyShift action_10
action_48 (13#) = happyShift action_11
action_48 (14#) = happyShift action_12
action_48 (15#) = happyShift action_13
action_48 (16#) = happyShift action_14
action_48 (17#) = happyShift action_15
action_48 (18#) = happyShift action_16
action_48 (19#) = happyShift action_17
action_48 (20#) = happyShift action_18
action_48 (21#) = happyShift action_19
action_48 (22#) = happyShift action_20
action_48 (23#) = happyShift action_21
action_48 (24#) = happyShift action_22
action_48 (25#) = happyShift action_23
action_48 (28#) = happyShift action_24
action_48 (46#) = happyShift action_26
action_48 (48#) = happyShift action_27
action_48 (49#) = happyShift action_28
action_48 (53#) = happyShift action_31
action_48 (6#) = happyGoto action_90
action_48 x = happyTcHack x happyFail (happyExpListPerState 48)

action_49 (7#) = happyShift action_5
action_49 (8#) = happyShift action_6
action_49 (9#) = happyShift action_7
action_49 (10#) = happyShift action_8
action_49 (11#) = happyShift action_9
action_49 (12#) = happyShift action_10
action_49 (13#) = happyShift action_11
action_49 (14#) = happyShift action_12
action_49 (15#) = happyShift action_13
action_49 (16#) = happyShift action_14
action_49 (17#) = happyShift action_15
action_49 (18#) = happyShift action_16
action_49 (19#) = happyShift action_17
action_49 (20#) = happyShift action_18
action_49 (21#) = happyShift action_19
action_49 (22#) = happyShift action_20
action_49 (23#) = happyShift action_21
action_49 (24#) = happyShift action_22
action_49 (25#) = happyShift action_23
action_49 (28#) = happyShift action_24
action_49 (46#) = happyShift action_26
action_49 (48#) = happyShift action_27
action_49 (49#) = happyShift action_28
action_49 (53#) = happyShift action_31
action_49 (6#) = happyGoto action_89
action_49 x = happyTcHack x happyFail (happyExpListPerState 49)

action_50 (7#) = happyShift action_5
action_50 (8#) = happyShift action_6
action_50 (9#) = happyShift action_7
action_50 (10#) = happyShift action_8
action_50 (11#) = happyShift action_9
action_50 (12#) = happyShift action_10
action_50 (13#) = happyShift action_11
action_50 (14#) = happyShift action_12
action_50 (15#) = happyShift action_13
action_50 (16#) = happyShift action_14
action_50 (17#) = happyShift action_15
action_50 (18#) = happyShift action_16
action_50 (19#) = happyShift action_17
action_50 (20#) = happyShift action_18
action_50 (21#) = happyShift action_19
action_50 (22#) = happyShift action_20
action_50 (23#) = happyShift action_21
action_50 (24#) = happyShift action_22
action_50 (25#) = happyShift action_23
action_50 (28#) = happyShift action_24
action_50 (46#) = happyShift action_26
action_50 (48#) = happyShift action_27
action_50 (49#) = happyShift action_28
action_50 (53#) = happyShift action_31
action_50 (6#) = happyGoto action_88
action_50 x = happyTcHack x happyFail (happyExpListPerState 50)

action_51 (7#) = happyShift action_5
action_51 (8#) = happyShift action_6
action_51 (9#) = happyShift action_7
action_51 (10#) = happyShift action_8
action_51 (11#) = happyShift action_9
action_51 (12#) = happyShift action_10
action_51 (13#) = happyShift action_11
action_51 (14#) = happyShift action_12
action_51 (15#) = happyShift action_13
action_51 (16#) = happyShift action_14
action_51 (17#) = happyShift action_15
action_51 (18#) = happyShift action_16
action_51 (19#) = happyShift action_17
action_51 (20#) = happyShift action_18
action_51 (21#) = happyShift action_19
action_51 (22#) = happyShift action_20
action_51 (23#) = happyShift action_21
action_51 (24#) = happyShift action_22
action_51 (25#) = happyShift action_23
action_51 (28#) = happyShift action_24
action_51 (46#) = happyShift action_26
action_51 (48#) = happyShift action_27
action_51 (49#) = happyShift action_28
action_51 (53#) = happyShift action_31
action_51 (6#) = happyGoto action_87
action_51 x = happyTcHack x happyFail (happyExpListPerState 51)

action_52 (7#) = happyShift action_5
action_52 (8#) = happyShift action_6
action_52 (9#) = happyShift action_7
action_52 (10#) = happyShift action_8
action_52 (11#) = happyShift action_9
action_52 (12#) = happyShift action_10
action_52 (13#) = happyShift action_11
action_52 (14#) = happyShift action_12
action_52 (15#) = happyShift action_13
action_52 (16#) = happyShift action_14
action_52 (17#) = happyShift action_15
action_52 (18#) = happyShift action_16
action_52 (19#) = happyShift action_17
action_52 (20#) = happyShift action_18
action_52 (21#) = happyShift action_19
action_52 (22#) = happyShift action_20
action_52 (23#) = happyShift action_21
action_52 (24#) = happyShift action_22
action_52 (25#) = happyShift action_23
action_52 (28#) = happyShift action_24
action_52 (46#) = happyShift action_26
action_52 (48#) = happyShift action_27
action_52 (49#) = happyShift action_28
action_52 (53#) = happyShift action_31
action_52 (6#) = happyGoto action_86
action_52 x = happyTcHack x happyFail (happyExpListPerState 52)

action_53 (7#) = happyShift action_5
action_53 (8#) = happyShift action_6
action_53 (9#) = happyShift action_7
action_53 (10#) = happyShift action_8
action_53 (11#) = happyShift action_9
action_53 (12#) = happyShift action_10
action_53 (13#) = happyShift action_11
action_53 (14#) = happyShift action_12
action_53 (15#) = happyShift action_13
action_53 (16#) = happyShift action_14
action_53 (17#) = happyShift action_15
action_53 (18#) = happyShift action_16
action_53 (19#) = happyShift action_17
action_53 (20#) = happyShift action_18
action_53 (21#) = happyShift action_19
action_53 (22#) = happyShift action_20
action_53 (23#) = happyShift action_21
action_53 (24#) = happyShift action_22
action_53 (25#) = happyShift action_23
action_53 (28#) = happyShift action_24
action_53 (46#) = happyShift action_26
action_53 (48#) = happyShift action_27
action_53 (49#) = happyShift action_28
action_53 (53#) = happyShift action_31
action_53 (6#) = happyGoto action_85
action_53 x = happyTcHack x happyFail (happyExpListPerState 53)

action_54 x = happyTcHack x happyReduce_27

action_55 x = happyTcHack x happyReduce_26

action_56 x = happyTcHack x happyReduce_3

action_57 (7#) = happyShift action_5
action_57 (8#) = happyShift action_6
action_57 (9#) = happyShift action_7
action_57 (10#) = happyShift action_8
action_57 (11#) = happyShift action_9
action_57 (12#) = happyShift action_10
action_57 (13#) = happyShift action_11
action_57 (14#) = happyShift action_12
action_57 (15#) = happyShift action_13
action_57 (16#) = happyShift action_14
action_57 (17#) = happyShift action_15
action_57 (18#) = happyShift action_16
action_57 (19#) = happyShift action_17
action_57 (20#) = happyShift action_18
action_57 (21#) = happyShift action_19
action_57 (22#) = happyShift action_20
action_57 (23#) = happyShift action_21
action_57 (24#) = happyShift action_22
action_57 (25#) = happyShift action_23
action_57 (28#) = happyShift action_24
action_57 (46#) = happyShift action_26
action_57 (48#) = happyShift action_27
action_57 (49#) = happyShift action_28
action_57 (53#) = happyShift action_31
action_57 (6#) = happyGoto action_84
action_57 x = happyTcHack x happyFail (happyExpListPerState 57)

action_58 (7#) = happyShift action_5
action_58 (8#) = happyShift action_6
action_58 (9#) = happyShift action_7
action_58 (10#) = happyShift action_8
action_58 (11#) = happyShift action_9
action_58 (12#) = happyShift action_10
action_58 (13#) = happyShift action_11
action_58 (14#) = happyShift action_12
action_58 (15#) = happyShift action_13
action_58 (16#) = happyShift action_14
action_58 (17#) = happyShift action_15
action_58 (18#) = happyShift action_16
action_58 (19#) = happyShift action_17
action_58 (20#) = happyShift action_18
action_58 (21#) = happyShift action_19
action_58 (22#) = happyShift action_20
action_58 (23#) = happyShift action_21
action_58 (24#) = happyShift action_22
action_58 (25#) = happyShift action_23
action_58 (28#) = happyShift action_24
action_58 (46#) = happyShift action_26
action_58 (48#) = happyShift action_27
action_58 (49#) = happyShift action_28
action_58 (53#) = happyShift action_31
action_58 (6#) = happyGoto action_83
action_58 x = happyTcHack x happyFail (happyExpListPerState 58)

action_59 (7#) = happyShift action_5
action_59 (8#) = happyShift action_6
action_59 (9#) = happyShift action_7
action_59 (10#) = happyShift action_8
action_59 (11#) = happyShift action_9
action_59 (12#) = happyShift action_10
action_59 (13#) = happyShift action_11
action_59 (14#) = happyShift action_12
action_59 (15#) = happyShift action_13
action_59 (16#) = happyShift action_14
action_59 (17#) = happyShift action_15
action_59 (18#) = happyShift action_16
action_59 (19#) = happyShift action_17
action_59 (20#) = happyShift action_18
action_59 (21#) = happyShift action_19
action_59 (22#) = happyShift action_20
action_59 (23#) = happyShift action_21
action_59 (24#) = happyShift action_22
action_59 (25#) = happyShift action_23
action_59 (28#) = happyShift action_24
action_59 (46#) = happyShift action_26
action_59 (48#) = happyShift action_27
action_59 (49#) = happyShift action_28
action_59 (53#) = happyShift action_31
action_59 (6#) = happyGoto action_82
action_59 x = happyTcHack x happyFail (happyExpListPerState 59)

action_60 (7#) = happyShift action_5
action_60 (8#) = happyShift action_6
action_60 (9#) = happyShift action_7
action_60 (10#) = happyShift action_8
action_60 (11#) = happyShift action_9
action_60 (12#) = happyShift action_10
action_60 (13#) = happyShift action_11
action_60 (14#) = happyShift action_12
action_60 (15#) = happyShift action_13
action_60 (16#) = happyShift action_14
action_60 (17#) = happyShift action_15
action_60 (18#) = happyShift action_16
action_60 (19#) = happyShift action_17
action_60 (20#) = happyShift action_18
action_60 (21#) = happyShift action_19
action_60 (22#) = happyShift action_20
action_60 (23#) = happyShift action_21
action_60 (24#) = happyShift action_22
action_60 (25#) = happyShift action_23
action_60 (28#) = happyShift action_24
action_60 (46#) = happyShift action_26
action_60 (48#) = happyShift action_27
action_60 (49#) = happyShift action_28
action_60 (53#) = happyShift action_31
action_60 (6#) = happyGoto action_81
action_60 x = happyTcHack x happyFail (happyExpListPerState 60)

action_61 (7#) = happyShift action_5
action_61 (8#) = happyShift action_6
action_61 (9#) = happyShift action_7
action_61 (10#) = happyShift action_8
action_61 (11#) = happyShift action_9
action_61 (12#) = happyShift action_10
action_61 (13#) = happyShift action_11
action_61 (14#) = happyShift action_12
action_61 (15#) = happyShift action_13
action_61 (16#) = happyShift action_14
action_61 (17#) = happyShift action_15
action_61 (18#) = happyShift action_16
action_61 (19#) = happyShift action_17
action_61 (20#) = happyShift action_18
action_61 (21#) = happyShift action_19
action_61 (22#) = happyShift action_20
action_61 (23#) = happyShift action_21
action_61 (24#) = happyShift action_22
action_61 (25#) = happyShift action_23
action_61 (28#) = happyShift action_24
action_61 (46#) = happyShift action_26
action_61 (48#) = happyShift action_27
action_61 (49#) = happyShift action_28
action_61 (53#) = happyShift action_31
action_61 (6#) = happyGoto action_80
action_61 x = happyTcHack x happyFail (happyExpListPerState 61)

action_62 (7#) = happyShift action_5
action_62 (8#) = happyShift action_6
action_62 (9#) = happyShift action_7
action_62 (10#) = happyShift action_8
action_62 (11#) = happyShift action_9
action_62 (12#) = happyShift action_10
action_62 (13#) = happyShift action_11
action_62 (14#) = happyShift action_12
action_62 (15#) = happyShift action_13
action_62 (16#) = happyShift action_14
action_62 (17#) = happyShift action_15
action_62 (18#) = happyShift action_16
action_62 (19#) = happyShift action_17
action_62 (20#) = happyShift action_18
action_62 (21#) = happyShift action_19
action_62 (22#) = happyShift action_20
action_62 (23#) = happyShift action_21
action_62 (24#) = happyShift action_22
action_62 (25#) = happyShift action_23
action_62 (28#) = happyShift action_24
action_62 (46#) = happyShift action_26
action_62 (48#) = happyShift action_27
action_62 (49#) = happyShift action_28
action_62 (53#) = happyShift action_31
action_62 (6#) = happyGoto action_79
action_62 x = happyTcHack x happyFail (happyExpListPerState 62)

action_63 (7#) = happyShift action_5
action_63 (8#) = happyShift action_6
action_63 (9#) = happyShift action_7
action_63 (10#) = happyShift action_8
action_63 (11#) = happyShift action_9
action_63 (12#) = happyShift action_10
action_63 (13#) = happyShift action_11
action_63 (14#) = happyShift action_12
action_63 (15#) = happyShift action_13
action_63 (16#) = happyShift action_14
action_63 (17#) = happyShift action_15
action_63 (18#) = happyShift action_16
action_63 (19#) = happyShift action_17
action_63 (20#) = happyShift action_18
action_63 (21#) = happyShift action_19
action_63 (22#) = happyShift action_20
action_63 (23#) = happyShift action_21
action_63 (24#) = happyShift action_22
action_63 (25#) = happyShift action_23
action_63 (28#) = happyShift action_24
action_63 (46#) = happyShift action_26
action_63 (48#) = happyShift action_27
action_63 (49#) = happyShift action_28
action_63 (53#) = happyShift action_31
action_63 (6#) = happyGoto action_78
action_63 x = happyTcHack x happyFail (happyExpListPerState 63)

action_64 (7#) = happyShift action_5
action_64 (8#) = happyShift action_6
action_64 (9#) = happyShift action_7
action_64 (10#) = happyShift action_8
action_64 (11#) = happyShift action_9
action_64 (12#) = happyShift action_10
action_64 (13#) = happyShift action_11
action_64 (14#) = happyShift action_12
action_64 (15#) = happyShift action_13
action_64 (16#) = happyShift action_14
action_64 (17#) = happyShift action_15
action_64 (18#) = happyShift action_16
action_64 (19#) = happyShift action_17
action_64 (20#) = happyShift action_18
action_64 (21#) = happyShift action_19
action_64 (22#) = happyShift action_20
action_64 (23#) = happyShift action_21
action_64 (24#) = happyShift action_22
action_64 (25#) = happyShift action_23
action_64 (28#) = happyShift action_24
action_64 (46#) = happyShift action_26
action_64 (48#) = happyShift action_27
action_64 (49#) = happyShift action_28
action_64 (53#) = happyShift action_31
action_64 (6#) = happyGoto action_77
action_64 x = happyTcHack x happyFail (happyExpListPerState 64)

action_65 (7#) = happyShift action_5
action_65 (8#) = happyShift action_6
action_65 (9#) = happyShift action_7
action_65 (10#) = happyShift action_8
action_65 (11#) = happyShift action_9
action_65 (12#) = happyShift action_10
action_65 (13#) = happyShift action_11
action_65 (14#) = happyShift action_12
action_65 (15#) = happyShift action_13
action_65 (16#) = happyShift action_14
action_65 (17#) = happyShift action_15
action_65 (18#) = happyShift action_16
action_65 (19#) = happyShift action_17
action_65 (20#) = happyShift action_18
action_65 (21#) = happyShift action_19
action_65 (22#) = happyShift action_20
action_65 (23#) = happyShift action_21
action_65 (24#) = happyShift action_22
action_65 (25#) = happyShift action_23
action_65 (28#) = happyShift action_24
action_65 (46#) = happyShift action_26
action_65 (48#) = happyShift action_27
action_65 (49#) = happyShift action_28
action_65 (53#) = happyShift action_31
action_65 (6#) = happyGoto action_76
action_65 x = happyTcHack x happyFail (happyExpListPerState 65)

action_66 (7#) = happyShift action_5
action_66 (8#) = happyShift action_6
action_66 (9#) = happyShift action_7
action_66 (10#) = happyShift action_8
action_66 (11#) = happyShift action_9
action_66 (12#) = happyShift action_10
action_66 (13#) = happyShift action_11
action_66 (14#) = happyShift action_12
action_66 (15#) = happyShift action_13
action_66 (16#) = happyShift action_14
action_66 (17#) = happyShift action_15
action_66 (18#) = happyShift action_16
action_66 (19#) = happyShift action_17
action_66 (20#) = happyShift action_18
action_66 (21#) = happyShift action_19
action_66 (22#) = happyShift action_20
action_66 (23#) = happyShift action_21
action_66 (24#) = happyShift action_22
action_66 (25#) = happyShift action_23
action_66 (28#) = happyShift action_24
action_66 (46#) = happyShift action_26
action_66 (48#) = happyShift action_27
action_66 (49#) = happyShift action_28
action_66 (53#) = happyShift action_31
action_66 (6#) = happyGoto action_75
action_66 x = happyTcHack x happyFail (happyExpListPerState 66)

action_67 (7#) = happyShift action_5
action_67 (8#) = happyShift action_6
action_67 (9#) = happyShift action_7
action_67 (10#) = happyShift action_8
action_67 (11#) = happyShift action_9
action_67 (12#) = happyShift action_10
action_67 (13#) = happyShift action_11
action_67 (14#) = happyShift action_12
action_67 (15#) = happyShift action_13
action_67 (16#) = happyShift action_14
action_67 (17#) = happyShift action_15
action_67 (18#) = happyShift action_16
action_67 (19#) = happyShift action_17
action_67 (20#) = happyShift action_18
action_67 (21#) = happyShift action_19
action_67 (22#) = happyShift action_20
action_67 (23#) = happyShift action_21
action_67 (24#) = happyShift action_22
action_67 (25#) = happyShift action_23
action_67 (28#) = happyShift action_24
action_67 (46#) = happyShift action_26
action_67 (48#) = happyShift action_27
action_67 (49#) = happyShift action_28
action_67 (53#) = happyShift action_31
action_67 (6#) = happyGoto action_74
action_67 x = happyTcHack x happyFail (happyExpListPerState 67)

action_68 (7#) = happyShift action_5
action_68 (8#) = happyShift action_6
action_68 (9#) = happyShift action_7
action_68 (10#) = happyShift action_8
action_68 (11#) = happyShift action_9
action_68 (12#) = happyShift action_10
action_68 (13#) = happyShift action_11
action_68 (14#) = happyShift action_12
action_68 (15#) = happyShift action_13
action_68 (16#) = happyShift action_14
action_68 (17#) = happyShift action_15
action_68 (18#) = happyShift action_16
action_68 (19#) = happyShift action_17
action_68 (20#) = happyShift action_18
action_68 (21#) = happyShift action_19
action_68 (22#) = happyShift action_20
action_68 (23#) = happyShift action_21
action_68 (24#) = happyShift action_22
action_68 (25#) = happyShift action_23
action_68 (28#) = happyShift action_24
action_68 (46#) = happyShift action_26
action_68 (48#) = happyShift action_27
action_68 (49#) = happyShift action_28
action_68 (53#) = happyShift action_31
action_68 (6#) = happyGoto action_73
action_68 x = happyTcHack x happyFail (happyExpListPerState 68)

action_69 (7#) = happyShift action_5
action_69 (8#) = happyShift action_6
action_69 (9#) = happyShift action_7
action_69 (10#) = happyShift action_8
action_69 (11#) = happyShift action_9
action_69 (12#) = happyShift action_10
action_69 (13#) = happyShift action_11
action_69 (14#) = happyShift action_12
action_69 (15#) = happyShift action_13
action_69 (16#) = happyShift action_14
action_69 (17#) = happyShift action_15
action_69 (18#) = happyShift action_16
action_69 (19#) = happyShift action_17
action_69 (20#) = happyShift action_18
action_69 (21#) = happyShift action_19
action_69 (22#) = happyShift action_20
action_69 (23#) = happyShift action_21
action_69 (24#) = happyShift action_22
action_69 (25#) = happyShift action_23
action_69 (28#) = happyShift action_24
action_69 (46#) = happyShift action_26
action_69 (48#) = happyShift action_27
action_69 (49#) = happyShift action_28
action_69 (53#) = happyShift action_31
action_69 (6#) = happyGoto action_72
action_69 x = happyTcHack x happyFail (happyExpListPerState 69)

action_70 (7#) = happyShift action_5
action_70 (8#) = happyShift action_6
action_70 (9#) = happyShift action_7
action_70 (10#) = happyShift action_8
action_70 (11#) = happyShift action_9
action_70 (12#) = happyShift action_10
action_70 (13#) = happyShift action_11
action_70 (14#) = happyShift action_12
action_70 (15#) = happyShift action_13
action_70 (16#) = happyShift action_14
action_70 (17#) = happyShift action_15
action_70 (18#) = happyShift action_16
action_70 (19#) = happyShift action_17
action_70 (20#) = happyShift action_18
action_70 (21#) = happyShift action_19
action_70 (22#) = happyShift action_20
action_70 (23#) = happyShift action_21
action_70 (24#) = happyShift action_22
action_70 (25#) = happyShift action_23
action_70 (28#) = happyShift action_24
action_70 (46#) = happyShift action_26
action_70 (48#) = happyShift action_27
action_70 (49#) = happyShift action_28
action_70 (53#) = happyShift action_31
action_70 (6#) = happyGoto action_71
action_70 x = happyTcHack x happyFail (happyExpListPerState 70)

action_71 x = happyTcHack x happyReduce_25

action_72 (33#) = happyShift action_57
action_72 (34#) = happyShift action_58
action_72 (35#) = happyShift action_59
action_72 (36#) = happyShift action_60
action_72 (37#) = happyShift action_61
action_72 (38#) = happyShift action_62
action_72 (39#) = happyShift action_63
action_72 (40#) = happyShift action_64
action_72 (41#) = happyShift action_65
action_72 (42#) = happyShift action_66
action_72 (43#) = happyShift action_67
action_72 (44#) = happyShift action_68
action_72 (47#) = happyShift action_70
action_72 x = happyTcHack x happyReduce_22

action_73 (33#) = happyShift action_57
action_73 (34#) = happyShift action_58
action_73 (35#) = happyShift action_59
action_73 (36#) = happyShift action_60
action_73 (37#) = happyShift action_61
action_73 (38#) = happyShift action_62
action_73 (39#) = happyShift action_63
action_73 (40#) = happyShift action_64
action_73 (41#) = happyShift action_65
action_73 (42#) = happyShift action_66
action_73 (43#) = happyShift action_67
action_73 (47#) = happyShift action_70
action_73 x = happyTcHack x happyReduce_20

action_74 (33#) = happyShift action_57
action_74 (34#) = happyShift action_58
action_74 (35#) = happyShift action_59
action_74 (36#) = happyShift action_60
action_74 (37#) = happyShift action_61
action_74 (38#) = happyShift action_62
action_74 (39#) = happyShift action_63
action_74 (40#) = happyShift action_64
action_74 (41#) = happyShift action_65
action_74 (42#) = happyShift action_66
action_74 (47#) = happyShift action_70
action_74 x = happyTcHack x happyReduce_23

action_75 (33#) = happyShift action_57
action_75 (34#) = happyShift action_58
action_75 (35#) = happyShift action_59
action_75 (36#) = happyShift action_60
action_75 (37#) = happyShift action_61
action_75 (38#) = happyShift action_62
action_75 (39#) = happyShift action_63
action_75 (40#) = happyShift action_64
action_75 (41#) = happyShift action_65
action_75 (47#) = happyShift action_70
action_75 x = happyTcHack x happyReduce_21

action_76 x = happyTcHack x happyReduce_19

action_77 x = happyTcHack x happyReduce_17

action_78 (40#) = happyShift action_64
action_78 (41#) = happyShift action_65
action_78 (47#) = happyShift action_70
action_78 x = happyTcHack x happyReduce_16

action_79 (40#) = happyShift action_64
action_79 (41#) = happyShift action_65
action_79 (47#) = happyShift action_70
action_79 x = happyTcHack x happyReduce_18

action_80 (33#) = happyShift action_57
action_80 (34#) = happyShift action_58
action_80 (35#) = happyShift action_59
action_80 (36#) = happyShift action_60
action_80 (38#) = happyShift action_62
action_80 (39#) = happyShift action_63
action_80 (40#) = happyShift action_64
action_80 (41#) = happyShift action_65
action_80 (47#) = happyShift action_70
action_80 x = happyTcHack x happyReduce_15

action_81 (38#) = happyShift action_62
action_81 (39#) = happyShift action_63
action_81 (40#) = happyShift action_64
action_81 (41#) = happyShift action_65
action_81 (47#) = happyShift action_70
action_81 x = happyTcHack x happyReduce_13

action_82 (38#) = happyShift action_62
action_82 (39#) = happyShift action_63
action_82 (40#) = happyShift action_64
action_82 (41#) = happyShift action_65
action_82 (47#) = happyShift action_70
action_82 x = happyTcHack x happyReduce_14

action_83 (38#) = happyShift action_62
action_83 (39#) = happyShift action_63
action_83 (40#) = happyShift action_64
action_83 (41#) = happyShift action_65
action_83 (47#) = happyShift action_70
action_83 x = happyTcHack x happyReduce_12

action_84 (38#) = happyShift action_62
action_84 (39#) = happyShift action_63
action_84 (40#) = happyShift action_64
action_84 (41#) = happyShift action_65
action_84 (47#) = happyShift action_70
action_84 x = happyTcHack x happyReduce_11

action_85 (29#) = happyShift action_124
action_85 (33#) = happyShift action_57
action_85 (34#) = happyShift action_58
action_85 (35#) = happyShift action_59
action_85 (36#) = happyShift action_60
action_85 (37#) = happyShift action_61
action_85 (38#) = happyShift action_62
action_85 (39#) = happyShift action_63
action_85 (40#) = happyShift action_64
action_85 (41#) = happyShift action_65
action_85 (42#) = happyShift action_66
action_85 (43#) = happyShift action_67
action_85 (44#) = happyShift action_68
action_85 (45#) = happyShift action_69
action_85 (47#) = happyShift action_70
action_85 x = happyTcHack x happyFail (happyExpListPerState 85)

action_86 (29#) = happyShift action_122
action_86 (30#) = happyShift action_123
action_86 (33#) = happyShift action_57
action_86 (34#) = happyShift action_58
action_86 (35#) = happyShift action_59
action_86 (36#) = happyShift action_60
action_86 (37#) = happyShift action_61
action_86 (38#) = happyShift action_62
action_86 (39#) = happyShift action_63
action_86 (40#) = happyShift action_64
action_86 (41#) = happyShift action_65
action_86 (42#) = happyShift action_66
action_86 (43#) = happyShift action_67
action_86 (44#) = happyShift action_68
action_86 (45#) = happyShift action_69
action_86 (47#) = happyShift action_70
action_86 x = happyTcHack x happyFail (happyExpListPerState 86)

action_87 (30#) = happyShift action_121
action_87 (33#) = happyShift action_57
action_87 (34#) = happyShift action_58
action_87 (35#) = happyShift action_59
action_87 (36#) = happyShift action_60
action_87 (37#) = happyShift action_61
action_87 (38#) = happyShift action_62
action_87 (39#) = happyShift action_63
action_87 (40#) = happyShift action_64
action_87 (41#) = happyShift action_65
action_87 (42#) = happyShift action_66
action_87 (43#) = happyShift action_67
action_87 (44#) = happyShift action_68
action_87 (45#) = happyShift action_69
action_87 (47#) = happyShift action_70
action_87 x = happyTcHack x happyFail (happyExpListPerState 87)

action_88 (30#) = happyShift action_120
action_88 (33#) = happyShift action_57
action_88 (34#) = happyShift action_58
action_88 (35#) = happyShift action_59
action_88 (36#) = happyShift action_60
action_88 (37#) = happyShift action_61
action_88 (38#) = happyShift action_62
action_88 (39#) = happyShift action_63
action_88 (40#) = happyShift action_64
action_88 (41#) = happyShift action_65
action_88 (42#) = happyShift action_66
action_88 (43#) = happyShift action_67
action_88 (44#) = happyShift action_68
action_88 (45#) = happyShift action_69
action_88 (47#) = happyShift action_70
action_88 x = happyTcHack x happyFail (happyExpListPerState 88)

action_89 (29#) = happyShift action_119
action_89 (33#) = happyShift action_57
action_89 (34#) = happyShift action_58
action_89 (35#) = happyShift action_59
action_89 (36#) = happyShift action_60
action_89 (37#) = happyShift action_61
action_89 (38#) = happyShift action_62
action_89 (39#) = happyShift action_63
action_89 (40#) = happyShift action_64
action_89 (41#) = happyShift action_65
action_89 (42#) = happyShift action_66
action_89 (43#) = happyShift action_67
action_89 (44#) = happyShift action_68
action_89 (45#) = happyShift action_69
action_89 (47#) = happyShift action_70
action_89 x = happyTcHack x happyFail (happyExpListPerState 89)

action_90 (30#) = happyShift action_118
action_90 (33#) = happyShift action_57
action_90 (34#) = happyShift action_58
action_90 (35#) = happyShift action_59
action_90 (36#) = happyShift action_60
action_90 (37#) = happyShift action_61
action_90 (38#) = happyShift action_62
action_90 (39#) = happyShift action_63
action_90 (40#) = happyShift action_64
action_90 (41#) = happyShift action_65
action_90 (42#) = happyShift action_66
action_90 (43#) = happyShift action_67
action_90 (44#) = happyShift action_68
action_90 (45#) = happyShift action_69
action_90 (47#) = happyShift action_70
action_90 x = happyTcHack x happyFail (happyExpListPerState 90)

action_91 (29#) = happyShift action_117
action_91 (33#) = happyShift action_57
action_91 (34#) = happyShift action_58
action_91 (35#) = happyShift action_59
action_91 (36#) = happyShift action_60
action_91 (37#) = happyShift action_61
action_91 (38#) = happyShift action_62
action_91 (39#) = happyShift action_63
action_91 (40#) = happyShift action_64
action_91 (41#) = happyShift action_65
action_91 (42#) = happyShift action_66
action_91 (43#) = happyShift action_67
action_91 (44#) = happyShift action_68
action_91 (45#) = happyShift action_69
action_91 (47#) = happyShift action_70
action_91 x = happyTcHack x happyFail (happyExpListPerState 91)

action_92 (29#) = happyShift action_116
action_92 (33#) = happyShift action_57
action_92 (34#) = happyShift action_58
action_92 (35#) = happyShift action_59
action_92 (36#) = happyShift action_60
action_92 (37#) = happyShift action_61
action_92 (38#) = happyShift action_62
action_92 (39#) = happyShift action_63
action_92 (40#) = happyShift action_64
action_92 (41#) = happyShift action_65
action_92 (42#) = happyShift action_66
action_92 (43#) = happyShift action_67
action_92 (44#) = happyShift action_68
action_92 (45#) = happyShift action_69
action_92 (47#) = happyShift action_70
action_92 x = happyTcHack x happyFail (happyExpListPerState 92)

action_93 (30#) = happyShift action_115
action_93 x = happyTcHack x happyFail (happyExpListPerState 93)

action_94 (29#) = happyShift action_114
action_94 (33#) = happyShift action_57
action_94 (34#) = happyShift action_58
action_94 (35#) = happyShift action_59
action_94 (36#) = happyShift action_60
action_94 (37#) = happyShift action_61
action_94 (38#) = happyShift action_62
action_94 (39#) = happyShift action_63
action_94 (40#) = happyShift action_64
action_94 (41#) = happyShift action_65
action_94 (42#) = happyShift action_66
action_94 (43#) = happyShift action_67
action_94 (44#) = happyShift action_68
action_94 (45#) = happyShift action_69
action_94 (47#) = happyShift action_70
action_94 x = happyTcHack x happyFail (happyExpListPerState 94)

action_95 (29#) = happyShift action_113
action_95 (33#) = happyShift action_57
action_95 (34#) = happyShift action_58
action_95 (35#) = happyShift action_59
action_95 (36#) = happyShift action_60
action_95 (37#) = happyShift action_61
action_95 (38#) = happyShift action_62
action_95 (39#) = happyShift action_63
action_95 (40#) = happyShift action_64
action_95 (41#) = happyShift action_65
action_95 (42#) = happyShift action_66
action_95 (43#) = happyShift action_67
action_95 (44#) = happyShift action_68
action_95 (45#) = happyShift action_69
action_95 (47#) = happyShift action_70
action_95 x = happyTcHack x happyFail (happyExpListPerState 95)

action_96 (29#) = happyShift action_112
action_96 (33#) = happyShift action_57
action_96 (34#) = happyShift action_58
action_96 (35#) = happyShift action_59
action_96 (36#) = happyShift action_60
action_96 (37#) = happyShift action_61
action_96 (38#) = happyShift action_62
action_96 (39#) = happyShift action_63
action_96 (40#) = happyShift action_64
action_96 (41#) = happyShift action_65
action_96 (42#) = happyShift action_66
action_96 (43#) = happyShift action_67
action_96 (44#) = happyShift action_68
action_96 (45#) = happyShift action_69
action_96 (47#) = happyShift action_70
action_96 x = happyTcHack x happyFail (happyExpListPerState 96)

action_97 (29#) = happyShift action_111
action_97 (33#) = happyShift action_57
action_97 (34#) = happyShift action_58
action_97 (35#) = happyShift action_59
action_97 (36#) = happyShift action_60
action_97 (37#) = happyShift action_61
action_97 (38#) = happyShift action_62
action_97 (39#) = happyShift action_63
action_97 (40#) = happyShift action_64
action_97 (41#) = happyShift action_65
action_97 (42#) = happyShift action_66
action_97 (43#) = happyShift action_67
action_97 (44#) = happyShift action_68
action_97 (45#) = happyShift action_69
action_97 (47#) = happyShift action_70
action_97 x = happyTcHack x happyFail (happyExpListPerState 97)

action_98 (30#) = happyShift action_110
action_98 (33#) = happyShift action_57
action_98 (34#) = happyShift action_58
action_98 (35#) = happyShift action_59
action_98 (36#) = happyShift action_60
action_98 (37#) = happyShift action_61
action_98 (38#) = happyShift action_62
action_98 (39#) = happyShift action_63
action_98 (40#) = happyShift action_64
action_98 (41#) = happyShift action_65
action_98 (42#) = happyShift action_66
action_98 (43#) = happyShift action_67
action_98 (44#) = happyShift action_68
action_98 (45#) = happyShift action_69
action_98 (47#) = happyShift action_70
action_98 x = happyTcHack x happyFail (happyExpListPerState 98)

action_99 (30#) = happyShift action_109
action_99 (33#) = happyShift action_57
action_99 (34#) = happyShift action_58
action_99 (35#) = happyShift action_59
action_99 (36#) = happyShift action_60
action_99 (37#) = happyShift action_61
action_99 (38#) = happyShift action_62
action_99 (39#) = happyShift action_63
action_99 (40#) = happyShift action_64
action_99 (41#) = happyShift action_65
action_99 (42#) = happyShift action_66
action_99 (43#) = happyShift action_67
action_99 (44#) = happyShift action_68
action_99 (45#) = happyShift action_69
action_99 (47#) = happyShift action_70
action_99 x = happyTcHack x happyFail (happyExpListPerState 99)

action_100 (33#) = happyShift action_57
action_100 (34#) = happyShift action_58
action_100 (35#) = happyShift action_59
action_100 (36#) = happyShift action_60
action_100 (37#) = happyShift action_61
action_100 (38#) = happyShift action_62
action_100 (39#) = happyShift action_63
action_100 (40#) = happyShift action_64
action_100 (41#) = happyShift action_65
action_100 (42#) = happyShift action_66
action_100 (43#) = happyShift action_67
action_100 (44#) = happyShift action_68
action_100 (45#) = happyShift action_69
action_100 (47#) = happyShift action_70
action_100 x = happyTcHack x happyReduce_10

action_101 x = happyTcHack x happyReduce_47

action_102 x = happyTcHack x happyReduce_4

action_103 (29#) = happyShift action_108
action_103 (33#) = happyShift action_57
action_103 (34#) = happyShift action_58
action_103 (35#) = happyShift action_59
action_103 (36#) = happyShift action_60
action_103 (37#) = happyShift action_61
action_103 (38#) = happyShift action_62
action_103 (39#) = happyShift action_63
action_103 (40#) = happyShift action_64
action_103 (41#) = happyShift action_65
action_103 (42#) = happyShift action_66
action_103 (43#) = happyShift action_67
action_103 (44#) = happyShift action_68
action_103 (45#) = happyShift action_69
action_103 (47#) = happyShift action_70
action_103 x = happyTcHack x happyFail (happyExpListPerState 103)

action_104 (29#) = happyShift action_107
action_104 (33#) = happyShift action_57
action_104 (34#) = happyShift action_58
action_104 (35#) = happyShift action_59
action_104 (36#) = happyShift action_60
action_104 (37#) = happyShift action_61
action_104 (38#) = happyShift action_62
action_104 (39#) = happyShift action_63
action_104 (40#) = happyShift action_64
action_104 (41#) = happyShift action_65
action_104 (42#) = happyShift action_66
action_104 (43#) = happyShift action_67
action_104 (44#) = happyShift action_68
action_104 (45#) = happyShift action_69
action_104 (47#) = happyShift action_70
action_104 x = happyTcHack x happyFail (happyExpListPerState 104)

action_105 (29#) = happyShift action_106
action_105 (33#) = happyShift action_57
action_105 (34#) = happyShift action_58
action_105 (35#) = happyShift action_59
action_105 (36#) = happyShift action_60
action_105 (37#) = happyShift action_61
action_105 (38#) = happyShift action_62
action_105 (39#) = happyShift action_63
action_105 (40#) = happyShift action_64
action_105 (41#) = happyShift action_65
action_105 (42#) = happyShift action_66
action_105 (43#) = happyShift action_67
action_105 (44#) = happyShift action_68
action_105 (45#) = happyShift action_69
action_105 (47#) = happyShift action_70
action_105 x = happyTcHack x happyFail (happyExpListPerState 105)

action_106 (7#) = happyShift action_5
action_106 (8#) = happyShift action_6
action_106 (9#) = happyShift action_7
action_106 (10#) = happyShift action_8
action_106 (11#) = happyShift action_9
action_106 (12#) = happyShift action_10
action_106 (13#) = happyShift action_11
action_106 (14#) = happyShift action_12
action_106 (15#) = happyShift action_13
action_106 (16#) = happyShift action_14
action_106 (17#) = happyShift action_15
action_106 (18#) = happyShift action_16
action_106 (19#) = happyShift action_17
action_106 (20#) = happyShift action_18
action_106 (21#) = happyShift action_19
action_106 (22#) = happyShift action_20
action_106 (23#) = happyShift action_21
action_106 (24#) = happyShift action_22
action_106 (25#) = happyShift action_23
action_106 (28#) = happyShift action_24
action_106 (31#) = happyShift action_25
action_106 (46#) = happyShift action_26
action_106 (48#) = happyShift action_27
action_106 (49#) = happyShift action_28
action_106 (50#) = happyShift action_29
action_106 (52#) = happyShift action_30
action_106 (53#) = happyShift action_31
action_106 (5#) = happyGoto action_133
action_106 (6#) = happyGoto action_4
action_106 x = happyTcHack x happyFail (happyExpListPerState 106)

action_107 (7#) = happyShift action_5
action_107 (8#) = happyShift action_6
action_107 (9#) = happyShift action_7
action_107 (10#) = happyShift action_8
action_107 (11#) = happyShift action_9
action_107 (12#) = happyShift action_10
action_107 (13#) = happyShift action_11
action_107 (14#) = happyShift action_12
action_107 (15#) = happyShift action_13
action_107 (16#) = happyShift action_14
action_107 (17#) = happyShift action_15
action_107 (18#) = happyShift action_16
action_107 (19#) = happyShift action_17
action_107 (20#) = happyShift action_18
action_107 (21#) = happyShift action_19
action_107 (22#) = happyShift action_20
action_107 (23#) = happyShift action_21
action_107 (24#) = happyShift action_22
action_107 (25#) = happyShift action_23
action_107 (28#) = happyShift action_24
action_107 (31#) = happyShift action_25
action_107 (46#) = happyShift action_26
action_107 (48#) = happyShift action_27
action_107 (49#) = happyShift action_28
action_107 (50#) = happyShift action_29
action_107 (52#) = happyShift action_30
action_107 (53#) = happyShift action_31
action_107 (5#) = happyGoto action_132
action_107 (6#) = happyGoto action_4
action_107 x = happyTcHack x happyFail (happyExpListPerState 107)

action_108 x = happyTcHack x happyReduce_28

action_109 (7#) = happyShift action_5
action_109 (8#) = happyShift action_6
action_109 (9#) = happyShift action_7
action_109 (10#) = happyShift action_8
action_109 (11#) = happyShift action_9
action_109 (12#) = happyShift action_10
action_109 (13#) = happyShift action_11
action_109 (14#) = happyShift action_12
action_109 (15#) = happyShift action_13
action_109 (16#) = happyShift action_14
action_109 (17#) = happyShift action_15
action_109 (18#) = happyShift action_16
action_109 (19#) = happyShift action_17
action_109 (20#) = happyShift action_18
action_109 (21#) = happyShift action_19
action_109 (22#) = happyShift action_20
action_109 (23#) = happyShift action_21
action_109 (24#) = happyShift action_22
action_109 (25#) = happyShift action_23
action_109 (28#) = happyShift action_24
action_109 (46#) = happyShift action_26
action_109 (48#) = happyShift action_27
action_109 (49#) = happyShift action_28
action_109 (53#) = happyShift action_31
action_109 (6#) = happyGoto action_131
action_109 x = happyTcHack x happyFail (happyExpListPerState 109)

action_110 (7#) = happyShift action_5
action_110 (8#) = happyShift action_6
action_110 (9#) = happyShift action_7
action_110 (10#) = happyShift action_8
action_110 (11#) = happyShift action_9
action_110 (12#) = happyShift action_10
action_110 (13#) = happyShift action_11
action_110 (14#) = happyShift action_12
action_110 (15#) = happyShift action_13
action_110 (16#) = happyShift action_14
action_110 (17#) = happyShift action_15
action_110 (18#) = happyShift action_16
action_110 (19#) = happyShift action_17
action_110 (20#) = happyShift action_18
action_110 (21#) = happyShift action_19
action_110 (22#) = happyShift action_20
action_110 (23#) = happyShift action_21
action_110 (24#) = happyShift action_22
action_110 (25#) = happyShift action_23
action_110 (28#) = happyShift action_24
action_110 (46#) = happyShift action_26
action_110 (48#) = happyShift action_27
action_110 (49#) = happyShift action_28
action_110 (53#) = happyShift action_31
action_110 (6#) = happyGoto action_130
action_110 x = happyTcHack x happyFail (happyExpListPerState 110)

action_111 x = happyTcHack x happyReduce_46

action_112 x = happyTcHack x happyReduce_43

action_113 x = happyTcHack x happyReduce_41

action_114 x = happyTcHack x happyReduce_40

action_115 (24#) = happyShift action_129
action_115 x = happyTcHack x happyFail (happyExpListPerState 115)

action_116 x = happyTcHack x happyReduce_39

action_117 x = happyTcHack x happyReduce_38

action_118 (24#) = happyShift action_128
action_118 x = happyTcHack x happyFail (happyExpListPerState 118)

action_119 x = happyTcHack x happyReduce_37

action_120 (7#) = happyShift action_5
action_120 (8#) = happyShift action_6
action_120 (9#) = happyShift action_7
action_120 (10#) = happyShift action_8
action_120 (11#) = happyShift action_9
action_120 (12#) = happyShift action_10
action_120 (13#) = happyShift action_11
action_120 (14#) = happyShift action_12
action_120 (15#) = happyShift action_13
action_120 (16#) = happyShift action_14
action_120 (17#) = happyShift action_15
action_120 (18#) = happyShift action_16
action_120 (19#) = happyShift action_17
action_120 (20#) = happyShift action_18
action_120 (21#) = happyShift action_19
action_120 (22#) = happyShift action_20
action_120 (23#) = happyShift action_21
action_120 (24#) = happyShift action_22
action_120 (25#) = happyShift action_23
action_120 (28#) = happyShift action_24
action_120 (46#) = happyShift action_26
action_120 (48#) = happyShift action_27
action_120 (49#) = happyShift action_28
action_120 (53#) = happyShift action_31
action_120 (6#) = happyGoto action_127
action_120 x = happyTcHack x happyFail (happyExpListPerState 120)

action_121 (7#) = happyShift action_5
action_121 (8#) = happyShift action_6
action_121 (9#) = happyShift action_7
action_121 (10#) = happyShift action_8
action_121 (11#) = happyShift action_9
action_121 (12#) = happyShift action_10
action_121 (13#) = happyShift action_11
action_121 (14#) = happyShift action_12
action_121 (15#) = happyShift action_13
action_121 (16#) = happyShift action_14
action_121 (17#) = happyShift action_15
action_121 (18#) = happyShift action_16
action_121 (19#) = happyShift action_17
action_121 (20#) = happyShift action_18
action_121 (21#) = happyShift action_19
action_121 (22#) = happyShift action_20
action_121 (23#) = happyShift action_21
action_121 (24#) = happyShift action_22
action_121 (25#) = happyShift action_23
action_121 (28#) = happyShift action_24
action_121 (46#) = happyShift action_26
action_121 (48#) = happyShift action_27
action_121 (49#) = happyShift action_28
action_121 (53#) = happyShift action_31
action_121 (6#) = happyGoto action_126
action_121 x = happyTcHack x happyFail (happyExpListPerState 121)

action_122 x = happyTcHack x happyReduce_30

action_123 (7#) = happyShift action_5
action_123 (8#) = happyShift action_6
action_123 (9#) = happyShift action_7
action_123 (10#) = happyShift action_8
action_123 (11#) = happyShift action_9
action_123 (12#) = happyShift action_10
action_123 (13#) = happyShift action_11
action_123 (14#) = happyShift action_12
action_123 (15#) = happyShift action_13
action_123 (16#) = happyShift action_14
action_123 (17#) = happyShift action_15
action_123 (18#) = happyShift action_16
action_123 (19#) = happyShift action_17
action_123 (20#) = happyShift action_18
action_123 (21#) = happyShift action_19
action_123 (22#) = happyShift action_20
action_123 (23#) = happyShift action_21
action_123 (24#) = happyShift action_22
action_123 (25#) = happyShift action_23
action_123 (28#) = happyShift action_24
action_123 (46#) = happyShift action_26
action_123 (48#) = happyShift action_27
action_123 (49#) = happyShift action_28
action_123 (53#) = happyShift action_31
action_123 (6#) = happyGoto action_125
action_123 x = happyTcHack x happyFail (happyExpListPerState 123)

action_124 x = happyTcHack x happyReduce_29

action_125 (29#) = happyShift action_141
action_125 (33#) = happyShift action_57
action_125 (34#) = happyShift action_58
action_125 (35#) = happyShift action_59
action_125 (36#) = happyShift action_60
action_125 (37#) = happyShift action_61
action_125 (38#) = happyShift action_62
action_125 (39#) = happyShift action_63
action_125 (40#) = happyShift action_64
action_125 (41#) = happyShift action_65
action_125 (42#) = happyShift action_66
action_125 (43#) = happyShift action_67
action_125 (44#) = happyShift action_68
action_125 (45#) = happyShift action_69
action_125 (47#) = happyShift action_70
action_125 x = happyTcHack x happyFail (happyExpListPerState 125)

action_126 (29#) = happyShift action_140
action_126 (33#) = happyShift action_57
action_126 (34#) = happyShift action_58
action_126 (35#) = happyShift action_59
action_126 (36#) = happyShift action_60
action_126 (37#) = happyShift action_61
action_126 (38#) = happyShift action_62
action_126 (39#) = happyShift action_63
action_126 (40#) = happyShift action_64
action_126 (41#) = happyShift action_65
action_126 (42#) = happyShift action_66
action_126 (43#) = happyShift action_67
action_126 (44#) = happyShift action_68
action_126 (45#) = happyShift action_69
action_126 (47#) = happyShift action_70
action_126 x = happyTcHack x happyFail (happyExpListPerState 126)

action_127 (30#) = happyShift action_139
action_127 (33#) = happyShift action_57
action_127 (34#) = happyShift action_58
action_127 (35#) = happyShift action_59
action_127 (36#) = happyShift action_60
action_127 (37#) = happyShift action_61
action_127 (38#) = happyShift action_62
action_127 (39#) = happyShift action_63
action_127 (40#) = happyShift action_64
action_127 (41#) = happyShift action_65
action_127 (42#) = happyShift action_66
action_127 (43#) = happyShift action_67
action_127 (44#) = happyShift action_68
action_127 (45#) = happyShift action_69
action_127 (47#) = happyShift action_70
action_127 x = happyTcHack x happyFail (happyExpListPerState 127)

action_128 (29#) = happyShift action_138
action_128 x = happyTcHack x happyFail (happyExpListPerState 128)

action_129 (29#) = happyShift action_137
action_129 x = happyTcHack x happyFail (happyExpListPerState 129)

action_130 (30#) = happyShift action_136
action_130 (33#) = happyShift action_57
action_130 (34#) = happyShift action_58
action_130 (35#) = happyShift action_59
action_130 (36#) = happyShift action_60
action_130 (37#) = happyShift action_61
action_130 (38#) = happyShift action_62
action_130 (39#) = happyShift action_63
action_130 (40#) = happyShift action_64
action_130 (41#) = happyShift action_65
action_130 (42#) = happyShift action_66
action_130 (43#) = happyShift action_67
action_130 (44#) = happyShift action_68
action_130 (45#) = happyShift action_69
action_130 (47#) = happyShift action_70
action_130 x = happyTcHack x happyFail (happyExpListPerState 130)

action_131 (30#) = happyShift action_135
action_131 (33#) = happyShift action_57
action_131 (34#) = happyShift action_58
action_131 (35#) = happyShift action_59
action_131 (36#) = happyShift action_60
action_131 (37#) = happyShift action_61
action_131 (38#) = happyShift action_62
action_131 (39#) = happyShift action_63
action_131 (40#) = happyShift action_64
action_131 (41#) = happyShift action_65
action_131 (42#) = happyShift action_66
action_131 (43#) = happyShift action_67
action_131 (44#) = happyShift action_68
action_131 (45#) = happyShift action_69
action_131 (47#) = happyShift action_70
action_131 x = happyTcHack x happyFail (happyExpListPerState 131)

action_132 (51#) = happyShift action_134
action_132 x = happyTcHack x happyReduce_6

action_133 x = happyTcHack x happyReduce_5

action_134 (7#) = happyShift action_5
action_134 (8#) = happyShift action_6
action_134 (9#) = happyShift action_7
action_134 (10#) = happyShift action_8
action_134 (11#) = happyShift action_9
action_134 (12#) = happyShift action_10
action_134 (13#) = happyShift action_11
action_134 (14#) = happyShift action_12
action_134 (15#) = happyShift action_13
action_134 (16#) = happyShift action_14
action_134 (17#) = happyShift action_15
action_134 (18#) = happyShift action_16
action_134 (19#) = happyShift action_17
action_134 (20#) = happyShift action_18
action_134 (21#) = happyShift action_19
action_134 (22#) = happyShift action_20
action_134 (23#) = happyShift action_21
action_134 (24#) = happyShift action_22
action_134 (25#) = happyShift action_23
action_134 (28#) = happyShift action_24
action_134 (31#) = happyShift action_25
action_134 (46#) = happyShift action_26
action_134 (48#) = happyShift action_27
action_134 (49#) = happyShift action_28
action_134 (50#) = happyShift action_29
action_134 (52#) = happyShift action_30
action_134 (53#) = happyShift action_31
action_134 (5#) = happyGoto action_145
action_134 (6#) = happyGoto action_4
action_134 x = happyTcHack x happyFail (happyExpListPerState 134)

action_135 (7#) = happyShift action_5
action_135 (8#) = happyShift action_6
action_135 (9#) = happyShift action_7
action_135 (10#) = happyShift action_8
action_135 (11#) = happyShift action_9
action_135 (12#) = happyShift action_10
action_135 (13#) = happyShift action_11
action_135 (14#) = happyShift action_12
action_135 (15#) = happyShift action_13
action_135 (16#) = happyShift action_14
action_135 (17#) = happyShift action_15
action_135 (18#) = happyShift action_16
action_135 (19#) = happyShift action_17
action_135 (20#) = happyShift action_18
action_135 (21#) = happyShift action_19
action_135 (22#) = happyShift action_20
action_135 (23#) = happyShift action_21
action_135 (24#) = happyShift action_22
action_135 (25#) = happyShift action_23
action_135 (28#) = happyShift action_24
action_135 (46#) = happyShift action_26
action_135 (48#) = happyShift action_27
action_135 (49#) = happyShift action_28
action_135 (53#) = happyShift action_31
action_135 (6#) = happyGoto action_144
action_135 x = happyTcHack x happyFail (happyExpListPerState 135)

action_136 (7#) = happyShift action_5
action_136 (8#) = happyShift action_6
action_136 (9#) = happyShift action_7
action_136 (10#) = happyShift action_8
action_136 (11#) = happyShift action_9
action_136 (12#) = happyShift action_10
action_136 (13#) = happyShift action_11
action_136 (14#) = happyShift action_12
action_136 (15#) = happyShift action_13
action_136 (16#) = happyShift action_14
action_136 (17#) = happyShift action_15
action_136 (18#) = happyShift action_16
action_136 (19#) = happyShift action_17
action_136 (20#) = happyShift action_18
action_136 (21#) = happyShift action_19
action_136 (22#) = happyShift action_20
action_136 (23#) = happyShift action_21
action_136 (24#) = happyShift action_22
action_136 (25#) = happyShift action_23
action_136 (28#) = happyShift action_24
action_136 (46#) = happyShift action_26
action_136 (48#) = happyShift action_27
action_136 (49#) = happyShift action_28
action_136 (53#) = happyShift action_31
action_136 (6#) = happyGoto action_143
action_136 x = happyTcHack x happyFail (happyExpListPerState 136)

action_137 x = happyTcHack x happyReduce_42

action_138 x = happyTcHack x happyReduce_33

action_139 (24#) = happyShift action_142
action_139 x = happyTcHack x happyFail (happyExpListPerState 139)

action_140 x = happyTcHack x happyReduce_32

action_141 x = happyTcHack x happyReduce_31

action_142 (29#) = happyShift action_148
action_142 x = happyTcHack x happyFail (happyExpListPerState 142)

action_143 (30#) = happyShift action_147
action_143 (33#) = happyShift action_57
action_143 (34#) = happyShift action_58
action_143 (35#) = happyShift action_59
action_143 (36#) = happyShift action_60
action_143 (37#) = happyShift action_61
action_143 (38#) = happyShift action_62
action_143 (39#) = happyShift action_63
action_143 (40#) = happyShift action_64
action_143 (41#) = happyShift action_65
action_143 (42#) = happyShift action_66
action_143 (43#) = happyShift action_67
action_143 (44#) = happyShift action_68
action_143 (45#) = happyShift action_69
action_143 (47#) = happyShift action_70
action_143 x = happyTcHack x happyFail (happyExpListPerState 143)

action_144 (29#) = happyShift action_146
action_144 (33#) = happyShift action_57
action_144 (34#) = happyShift action_58
action_144 (35#) = happyShift action_59
action_144 (36#) = happyShift action_60
action_144 (37#) = happyShift action_61
action_144 (38#) = happyShift action_62
action_144 (39#) = happyShift action_63
action_144 (40#) = happyShift action_64
action_144 (41#) = happyShift action_65
action_144 (42#) = happyShift action_66
action_144 (43#) = happyShift action_67
action_144 (44#) = happyShift action_68
action_144 (45#) = happyShift action_69
action_144 (47#) = happyShift action_70
action_144 x = happyTcHack x happyFail (happyExpListPerState 144)

action_145 x = happyTcHack x happyReduce_7

action_146 x = happyTcHack x happyReduce_34

action_147 (7#) = happyShift action_5
action_147 (8#) = happyShift action_6
action_147 (9#) = happyShift action_7
action_147 (10#) = happyShift action_8
action_147 (11#) = happyShift action_9
action_147 (12#) = happyShift action_10
action_147 (13#) = happyShift action_11
action_147 (14#) = happyShift action_12
action_147 (15#) = happyShift action_13
action_147 (16#) = happyShift action_14
action_147 (17#) = happyShift action_15
action_147 (18#) = happyShift action_16
action_147 (19#) = happyShift action_17
action_147 (20#) = happyShift action_18
action_147 (21#) = happyShift action_19
action_147 (22#) = happyShift action_20
action_147 (23#) = happyShift action_21
action_147 (24#) = happyShift action_22
action_147 (25#) = happyShift action_23
action_147 (28#) = happyShift action_24
action_147 (46#) = happyShift action_26
action_147 (48#) = happyShift action_27
action_147 (49#) = happyShift action_28
action_147 (53#) = happyShift action_31
action_147 (6#) = happyGoto action_149
action_147 x = happyTcHack x happyFail (happyExpListPerState 147)

action_148 x = happyTcHack x happyReduce_36

action_149 (29#) = happyShift action_150
action_149 (33#) = happyShift action_57
action_149 (34#) = happyShift action_58
action_149 (35#) = happyShift action_59
action_149 (36#) = happyShift action_60
action_149 (37#) = happyShift action_61
action_149 (38#) = happyShift action_62
action_149 (39#) = happyShift action_63
action_149 (40#) = happyShift action_64
action_149 (41#) = happyShift action_65
action_149 (42#) = happyShift action_66
action_149 (43#) = happyShift action_67
action_149 (44#) = happyShift action_68
action_149 (45#) = happyShift action_69
action_149 (47#) = happyShift action_70
action_149 x = happyTcHack x happyFail (happyExpListPerState 149)

action_150 x = happyTcHack x happyReduce_35

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_1 = happySpecReduce_0  4# happyReduction_1
happyReduction_1  =  HappyAbsSyn4
		 ([]
	)

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_2 = happySpecReduce_2  4# happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_2 : happy_var_1
	)
happyReduction_2 _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_3 = happySpecReduce_2  5# happyReduction_3
happyReduction_3 _
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (Statement happy_var_1
	)
happyReduction_3 _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_4 = happySpecReduce_3  5# happyReduction_4
happyReduction_4 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Block (reverse happy_var_2)
	)
happyReduction_4 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_5 = happyReduce 5# 5# happyReduction_5
happyReduction_5 ((HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (While happy_var_3 happy_var_5
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_6 = happyReduce 5# 5# happyReduction_6
happyReduction_6 ((HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (If happy_var_3 happy_var_5 (Block [])
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_7 = happyReduce 7# 5# happyReduction_7
happyReduction_7 ((HappyAbsSyn5  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (If happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_8 = happySpecReduce_1  6# happyReduction_8
happyReduction_8 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn6
		 (TmInt happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_9 = happySpecReduce_1  6# happyReduction_9
happyReduction_9 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn6
		 (TmVar happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_10 = happySpecReduce_3  6# happyReduction_10
happyReduction_10 (HappyAbsSyn6  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn6
		 (TmAssign happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_11 = happySpecReduce_3  6# happyReduction_11
happyReduction_11 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmLessThan happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_12 = happySpecReduce_3  6# happyReduction_12
happyReduction_12 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmGreaterThan happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_13 = happySpecReduce_3  6# happyReduction_13
happyReduction_13 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmEqLessThan happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_14 = happySpecReduce_3  6# happyReduction_14
happyReduction_14 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmEqGreaterThan happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_15 = happySpecReduce_3  6# happyReduction_15
happyReduction_15 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmEquals happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_16 = happySpecReduce_3  6# happyReduction_16
happyReduction_16 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmMinus happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_17 = happySpecReduce_3  6# happyReduction_17
happyReduction_17 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmMult happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_18 = happySpecReduce_3  6# happyReduction_18
happyReduction_18 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmPlus happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_19 = happySpecReduce_3  6# happyReduction_19
happyReduction_19 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmDiv happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_20 = happySpecReduce_3  6# happyReduction_20
happyReduction_20 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmBAnd happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_21 = happySpecReduce_3  6# happyReduction_21
happyReduction_21 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmAnd happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_22 = happySpecReduce_3  6# happyReduction_22
happyReduction_22 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmOr happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_23 = happySpecReduce_3  6# happyReduction_23
happyReduction_23 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmBOr happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_24 = happySpecReduce_2  6# happyReduction_24
happyReduction_24 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (TmBoolNeg happy_var_2
	)
happyReduction_24 _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_25 = happySpecReduce_3  6# happyReduction_25
happyReduction_25 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (TmMod happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_26 = happySpecReduce_2  6# happyReduction_26
happyReduction_26 (HappyTerminal (TokenVar _ happy_var_2))
	_
	 =  HappyAbsSyn6
		 (TmIntDecl happy_var_2
	)
happyReduction_26 _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_27 = happySpecReduce_2  6# happyReduction_27
happyReduction_27 (HappyTerminal (TokenVar _ happy_var_2))
	_
	 =  HappyAbsSyn6
		 (TmTileDecl happy_var_2
	)
happyReduction_27 _ _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_28 = happyReduce 4# 6# happyReduction_28
happyReduction_28 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TmBuildFPrint happy_var_3
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_29 = happyReduce 4# 6# happyReduction_29
happyReduction_29 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TmBuildFRead happy_var_3
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_30 = happyReduce 4# 6# happyReduction_30
happyReduction_30 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TmBuildFWrite happy_var_3 Nothing
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_31 = happyReduce 6# 6# happyReduction_31
happyReduction_31 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TmBuildFWrite happy_var_3 (Just happy_var_5)
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_32 = happyReduce 6# 6# happyReduction_32
happyReduction_32 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TmBuildFStack happy_var_3 happy_var_5
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_33 = happyReduce 6# 6# happyReduction_33
happyReduction_33 (_ `HappyStk`
	(HappyTerminal (TokenInt _ happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TmBuildFScale happy_var_3 happy_var_5
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_34 = happyReduce 8# 6# happyReduction_34
happyReduction_34 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TmBuildFAccess happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_35 = happyReduce 10# 6# happyReduction_35
happyReduction_35 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_9) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TmBuildFModify happy_var_3 happy_var_5 happy_var_7 happy_var_9
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_36 = happyReduce 8# 6# happyReduction_36
happyReduction_36 (_ `HappyStk`
	(HappyTerminal (TokenInt _ happy_var_7)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TmBuildFAlternate happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_37 = happyReduce 4# 6# happyReduction_37
happyReduction_37 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TmBuildFRotate happy_var_3
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_38 = happyReduce 4# 6# happyReduction_38
happyReduction_38 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TmBuildFReflectX happy_var_3
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_39 = happyReduce 4# 6# happyReduction_39
happyReduction_39 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TmBuildFReflectY happy_var_3
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_40 = happyReduce 4# 6# happyReduction_40
happyReduction_40 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TmBuildFGetCol happy_var_3
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_41 = happyReduce 4# 6# happyReduction_41
happyReduction_41 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TmBuildFGetRow happy_var_3
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_42 = happyReduce 6# 6# happyReduction_42
happyReduction_42 (_ `HappyStk`
	(HappyTerminal (TokenInt _ happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInt _ happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TmBuildFMakeTile happy_var_3 happy_var_5
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_43 = happyReduce 4# 6# happyReduction_43
happyReduction_43 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TmBuildFBlank happy_var_3
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_44 = happySpecReduce_1  6# happyReduction_44
happyReduction_44 (HappyTerminal (TokenBool  _ happy_var_1))
	 =  HappyAbsSyn6
		 (TmBool happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_45 = happySpecReduce_1  6# happyReduction_45
happyReduction_45 (HappyTerminal (TokenString _ happy_var_1))
	 =  HappyAbsSyn6
		 (TmStr happy_var_1
	)
happyReduction_45 _  = notHappyAtAll 

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_46 = happyReduce 4# 6# happyReduction_46
happyReduction_46 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TmNeg happy_var_3
	) `HappyStk` happyRest

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_47 = happySpecReduce_3  6# happyReduction_47
happyReduction_47 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 54# 54# notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenConstructorInt _ -> cont 7#;
	TokenConstructorTile _ -> cont 8#;
	TokenFunctionRead _ -> cont 9#;
	TokenFunctionWrite _ -> cont 10#;
	TokenFunctionStack _ -> cont 11#;
	TokenFunctionAlternate _ -> cont 12#;
	TokenFunctionRotate _ -> cont 13#;
	TokenFunctionScale _ -> cont 14#;
	TokenFunctionReflectX _ -> cont 15#;
	TokenFunctionReflectY _ -> cont 16#;
	TokenFunctionMakeTile _ -> cont 17#;
	TokenFunctionGetCol _ -> cont 18#;
	TokenFunctionGetRow _ -> cont 19#;
	TokenFunctionBlank _ -> cont 20#;
	TokenFunctionNeg _ -> cont 21#;
	TokenFunctionModify _ -> cont 22#;
	TokenFunctionAccess _ -> cont 23#;
	TokenInt _ happy_dollar_dollar -> cont 24#;
	TokenVar _ happy_dollar_dollar -> cont 25#;
	TokenSemicolon _ -> cont 26#;
	TokenAssignment _ -> cont 27#;
	TokenLParen _ -> cont 28#;
	TokenRParen _ -> cont 29#;
	TokenComma _ -> cont 30#;
	TokenLBraces _ -> cont 31#;
	TokenRBraces _ -> cont 32#;
	TokenLessThan _ -> cont 33#;
	TokenGreaterThan _ -> cont 34#;
	TokenEqGreaterThan _ -> cont 35#;
	TokenEqLessThan _ -> cont 36#;
	TokenEquals _ -> cont 37#;
	TokenPlus _ -> cont 38#;
	TokenMinus _ -> cont 39#;
	TokenTimes _ -> cont 40#;
	TokenDiv _ -> cont 41#;
	TokenAnd _ -> cont 42#;
	TokenOr _ -> cont 43#;
	TokenBAnd _ -> cont 44#;
	TokenBOr _ -> cont 45#;
	TokenBoolNeg _ -> cont 46#;
	TokenMod _ -> cont 47#;
	TokenBool  _ happy_dollar_dollar -> cont 48#;
	TokenFunctionPrint _ -> cont 49#;
	TokenIf _ -> cont 50#;
	TokenElse _ -> cont 51#;
	TokenWhile _ -> cont 52#;
	TokenString _ happy_dollar_dollar -> cont 53#;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 54# tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parseCalc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error" 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))

data Program = Program [Statement]
   deriving (Show,Eq)


data Statement =  Statement Exp 
                | Block [Statement]
                | While Exp Statement
                | If Exp Statement Statement
   deriving (Show,Eq)

data Exp =    TmInt Int 
            | TmVar String 
            | TmAssign String Exp
            | TmIntDecl String
            | TmTileDecl String
            | TmBuildFPrint Exp
            | TmBuildFRead Exp
            | TmBuildFWrite Exp (Maybe Exp)
            | TmBuildFStack Exp Exp
            | TmBuildFScale Exp Int
            | TmBuildFAlternate Exp Exp Int
            | TmBuildFRotate Exp
            | TmBuildFReflectX Exp
            | TmBuildFReflectY Exp
            | TmBuildFMakeTile Int Int
            | TmBuildFGetCol Exp
            | TmBuildFGetRow Exp
            | TmBuildFAccess Exp Exp Exp
            | TmBuildFModify Exp Exp Exp Exp
            | TmBuildFBlank Exp
            | TmBool Bool
            | TmBoolNeg Exp
            | TmLessThan Exp Exp
            | TmPlus Exp Exp
            | TmDiv Exp Exp
            | TmGreaterThan Exp Exp
            | TmEqGreaterThan Exp Exp
            | TmEqLessThan Exp Exp
            | TmEquals Exp Exp
            | TmMod Exp Exp
            | TmMinus Exp Exp
            | TmMult Exp Exp
            | TmAnd Exp Exp
            | TmOr Exp Exp
            | TmBAnd Exp Exp
            | TmBOr Exp Exp
            | TmNeg Exp
            | TmTile [[Int]]
            | TmStr String
    deriving (Show,Eq)
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $













-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Prelude.Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Prelude.Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Prelude.Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif



















data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 1# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j ) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

































indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#




{-# INLINE happyLt #-}
happyLt x y = LT(x,y)


readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (indexShortOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 4#))) (bit `Prelude.mod` 16)
  where unbox_int (Happy_GHC_Exts.I# x) = x






data HappyAddr = HappyA# Happy_GHC_Exts.Addr#


-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Happy_GHC_Exts.Int# ->                    -- token number
         Happy_GHC_Exts.Int# ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 1# tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Happy_GHC_Exts.Int#
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n ((_):(t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist 1# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action 1# 1# tk (HappyState (action)) sts ((HappyErrorToken (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
