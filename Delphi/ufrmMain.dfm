object frmMain: TfrmMain
  Left = 290
  Top = 273
  BorderIcons = [biMinimize]
  Caption = 'Password Generator'
  ClientHeight = 259
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  DesignSize = (
    549
    259)
  PixelsPerInch = 96
  TextHeight = 16
  object lblLength: TLabel
    Left = 308
    Top = 16
    Width = 61
    Height = 16
    Caption = '&Length: 10'
  end
  object btnGenPw: TBitBtn
    Left = 16
    Top = 16
    Width = 161
    Height = 49
    Hint = 'generate a random password and display it in the box below'
    Caption = '&Generate Password'
    TabOrder = 0
    OnClick = btnGenPwClick
  end
  object tbPwLen: TTrackBar
    Left = 308
    Top = 46
    Width = 201
    Height = 45
    Hint = 'select the length of the generated password'
    Max = 30
    Min = 1
    Position = 10
    TabOrder = 1
    OnChange = tbPwLenChange
  end
  object grpPwType: TRadioGroup
    Left = 308
    Top = 97
    Width = 161
    Height = 121
    Hint = 
      'Alternating Hands uses a letter from alternating hands on the QW' +
      'ERTY keyboard'
    Caption = '&Type'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Alternating Hands'
      'Left Hand Only'
      'Right Hand Only'
      'Numeric Only')
    ParentFont = False
    TabOrder = 2
    OnClick = grpPwTypeClick
  end
  object edtPassword: TEdit
    Left = 16
    Top = 72
    Width = 273
    Height = 23
    TabStop = False
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object cbPunctuation: TCheckBox
    Left = 308
    Top = 224
    Width = 161
    Height = 25
    Hint = 'append a punctuation mark (but not for numeric passwords)'
    Caption = 'Append &Punctuation'
    TabOrder = 4
    WordWrap = True
  end
  object cbHide: TCheckBox
    Left = 64
    Top = 112
    Width = 73
    Height = 25
    Hint = 
      'instead of showing the actual generated password above, just sho' +
      'w some asterisks'
    Caption = '&Hide'
    TabOrder = 5
    WordWrap = True
    OnClick = cbHideClick
  end
  object btnCopyToClipboard: TBitBtn
    Left = 16
    Top = 144
    Width = 161
    Height = 41
    Caption = '&Copy to clipboard'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666000000
      00066666668888888886666666377777770666666687777777866666663FBFBF
      B7066666668F7F7F77866666663BFBFBF70666666687F7F7F7866666663FBFBF
      B7066666668F7F7F77866000003BFBFBF70668888887F7F7F7866877773FBFBF
      B7066877778F7F7F778668FFFF3BFBF0000668777787F7F8888668FFFF3FBFB7
      F3666877778F7F78F86668FFFF3BFBF7366668777787F7F8866668FFFF333333
      6666687777888888666668FFFFFFF0666666687777777866666668FFFF000066
      6666687777888866666668FFFF7F86666666687777878666666668FFFF786666
      6666687777886666666668888886666666666888888666666666}
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 6
    OnClick = btnCopyToClipboardClick
  end
  object btnExit: TBitBtn
    Left = 16
    Top = 216
    Width = 89
    Height = 33
    Anchors = [akLeft, akBottom]
    Caption = 'E&xit'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0060FF00FF0088
      008868FF88FF88778877FF00FF00FF008800FF88FF88FF88778800FF00FF0007
      008888FF88FF8887887700000000770780008888888877878888666666070007
      8806666666878887888666666600000788066666668888878886666666088807
      8806666666888887888666666608880788066666668888878886660000000807
      0806668888888887F8866609999908078806668FFFFF88878886609999908807
      880668FFFFF888878886609099088807880668F8FF8888878886600090088807
      88066888F8888887888666600608888078066668868888887886666666088888
      0706666666888888878666666600000000066666668888888886}
    NumGlyphs = 2
    TabOrder = 7
    OnClick = btnExitClick
  end
end
