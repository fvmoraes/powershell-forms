# Additions
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Colors and Formats
$SuccessColor = [System.Drawing.ColorTranslator]::FromHtml("#006400")
#$DangerColor = [System.Drawing.ColorTranslator]::FromHtml("#ed4343")
$PrimaryColor = [System.Drawing.ColorTranslator]::FromHtml("#24d324")
$SecondaryColor = [System.Drawing.ColorTranslator]::FromHtml("#00a1f6")
$ContrastColor = [System.Drawing.ColorTranslator]::FromHtml("#1f1f1f")
$LabelColor = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$LabelBold = New-Object System.Drawing.Font("Calibri",11,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

# Main Form
$MainForm = New-Object System.Windows.Forms.Form
$MainForm.Text ='Checklist Helper'
$MainForm.Width = 600
$MainForm.Height = 500
$MainForm.AutoSize = $true
$MainForm.StartPosition = 'CenterScreen'
$MainForm.Icon = New-Object system.drawing.icon (".\icon\nelogica.ico")
# Set the Theme of Form
$Font = New-Object System.Drawing.Font("Calibri",11)
$MainForm.Font = $Font
$MainForm.BackColor = $ContrastColor

##########################################################################################################################

# Group that will contain radio buttons for selection of executable
$RadioButtonGroupBoxExe = New-Object System.Windows.Forms.GroupBox
$RadioButtonGroupBoxExe.Location = New-Object System.Drawing.Point(20,20)
$RadioButtonGroupBoxExe.size = New-Object System.Drawing.Size(550,170)
$RadioButtonGroupBoxExe.ForeColor = $SecondaryColor
$RadioButtonGroupBoxExe.text = "Executables"

# Create the collection of radio buttons for teams choice
# RadioBottonProfit
$RadioButtonProfit = New-Object System.Windows.Forms.RadioButton
$RadioButtonProfit.Location = New-Object System.Drawing.Point(25,30)
$RadioButtonProfit.size = New-Object System.Drawing.Size(100,20)
$RadioButtonProfit.Checked = $true 
$RadioButtonProfit.Text = "WDI Profit"
$RadioButtonProfit.ForeColor = $LabelColor
$RadioButtonProfit.Add_Click({FilterWDI})
# RadioBottonCrypto
$RadioButtonCrypto = New-Object System.Windows.Forms.RadioButton
$RadioButtonCrypto.Location = New-Object System.Drawing.Point(160,30)
$RadioButtonCrypto.size = New-Object System.Drawing.Size(100,20)
$RadioButtonCrypto.Checked = $false
$RadioButtonCrypto.Text = "WDI Crypto"
$RadioButtonCrypto.ForeColor = $LabelColor
$RadioButtonCrypto.Add_Click({FilterWDI})
# RadioBottonRico
$RadioButtonRico = New-Object System.Windows.Forms.RadioButton
$RadioButtonRico.Location = New-Object System.Drawing.Point(310,30)
$RadioButtonRico.size = New-Object System.Drawing.Size(100,20)
$RadioButtonRico.Checked = $false
$RadioButtonRico.Text = "WDI Rico"
$RadioButtonRico.ForeColor = $LabelColor
$RadioButtonRico.Add_Click({FilterWDI})
# RadioBottonGenial
$RadioButtonGenial = New-Object System.Windows.Forms.RadioButton
$RadioButtonGenial.Location = New-Object System.Drawing.Point(440,30)
$RadioButtonGenial.size = New-Object System.Drawing.Size(100,20)
$RadioButtonGenial.Checked = $false
$RadioButtonGenial.Text = "WDI Genial"
$RadioButtonGenial.ForeColor = $LabelColor
$RadioButtonGenial.Add_Click({FilterWDI})

# Label relacioned on version name
$LabelVersion = New-Object System.Windows.Forms.Label
$LabelVersion.Text = "Select version:"
$LabelVersion.Location  = New-Object System.Drawing.Point(25,70)
$LabelVersion.AutoSize = $true
$LabelVersion.ForeColor = $LabelColor
$MainForm.Controls.Add($LabelVersion)

# ComboBox relacioned on choice version of executable
$ComboBoxVersion = New-Object System.Windows.Forms.ComboBox
$ComboBoxVersion.Width = 500
$ComboBoxVersion.Height = 30
$ComboBoxVersion.Location  = New-Object System.Drawing.Point(25,90)
$ComboBoxVersion.DropDownStyle =[System.Windows.Forms.ComboBoxStyle]::DropDownList
$MainForm.Controls.Add($ComboBoxVersion)


# Label relacioned on warning for executable localization
$LabelWarningLocalization = New-Object System.Windows.Forms.Label
$LabelWarningLocalization.Text = "Only the versions available in the directory where the script was executed appear here"
$LabelWarningLocalization.Location  = New-Object System.Drawing.Point(25,120)
$LabelWarningLocalization.AutoSize = $true
$LabelWarningLocalization.ForeColor = $PrimaryColor
$LabelWarningLocalization.Font = New-Object System.Drawing.Font("Calibri",10)
$MainForm.Controls.Add($LabelWarningLocalization)

##########################################################################################################################

# Group that will contain radio buttons
$RadioButtonGroupBoxTeams = New-Object System.Windows.Forms.GroupBox
$RadioButtonGroupBoxTeams.Location = New-Object System.Drawing.Point(20,200)
$RadioButtonGroupBoxTeams.size = New-Object System.Drawing.Size(550,150)
$RadioButtonGroupBoxTeams.ForeColor = $SecondaryColor
$RadioButtonGroupBoxTeams.text = "Checklist Teams"

# Create the collection of radio buttons for teams choice
# RadioBottonClean
$RadioButtonClean = New-Object System.Windows.Forms.RadioButton
$RadioButtonClean.Location = New-Object System.Drawing.Point(50,30)
$RadioButtonClean.size = New-Object System.Drawing.Size(200,20)
$RadioButtonClean.Checked = $true 
$RadioButtonClean.Text = "Clean Instrumentation"
$RadioButtonClean.ForeColor = $LabelColor
# RadioBottonROT
$RadioButtonROT = New-Object System.Windows.Forms.RadioButton
$RadioButtonROT.Location = New-Object System.Drawing.Point(50,70)
$RadioButtonROT.size = New-Object System.Drawing.Size(200,20)
$RadioButtonROT.Checked = $false 
$RadioButtonROT.Text = "ROT Team"
$RadioButtonROT.ForeColor = $LabelColor
# RadioBottonMD
$RadioButtonMD = New-Object System.Windows.Forms.RadioButton
$RadioButtonMD.Location = New-Object System.Drawing.Point(50,110)
$RadioButtonMD.size = New-Object System.Drawing.Size(200,20)
$RadioButtonMD.Checked = $false
$RadioButtonMD.Text = "MD Team"
$RadioButtonMD.ForeColor = $LabelColor
# RadioBottonSI
$RadioButtonSI = New-Object System.Windows.Forms.RadioButton
$RadioButtonSI.Location = New-Object System.Drawing.Point(225,70)
$RadioButtonSI.size = New-Object System.Drawing.Size(200,20)
$RadioButtonSI.Checked = $false
$RadioButtonSI.Text = "SI Team"
$RadioButtonSI.ForeColor = $LabelColor
# RadioBottonAll
$RadioButtonAll = New-Object System.Windows.Forms.RadioButton
$RadioButtonAll.Location = New-Object System.Drawing.Point(225,110)
$RadioButtonAll.size = New-Object System.Drawing.Size(200,20)
$RadioButtonAll.Checked = $false
$RadioButtonAll.Text = "All Teams"
$RadioButtonAll.ForeColor = $LabelColor

##########################################################################################################################

# Function for read disponible WDI executables in .\executables
function InsertComboBoxValues($type){
	$Versions = @(Get-ChildItem -Recurse -Name -Include "$type*.exe" -Path ".\executables\")
	foreach ($Version in $Versions)
	{
		$ComboBoxVersion.Items.Add($Version)
	}
	$ValueComboBox = $ComboBoxVersion.Items.Count-1
	$ComboBoxVersion.SelectedIndex = $ValueComboBox
}

# Function for ative ProgressBar
function ActiveProgressBar(){
	For ($i=0; $i -le 99; $i++){
		$LabelInformationProgressBar.Text = "$i%"
		$ProgressBarGeneral.Value = $ProgressBarGeneral.Value+1
		$MainForm.Refresh()
	}
	$LabelInformationProgressBar.Text = "Opening the selected executable, wait..."
	Start-Sleep -Seconds 3
}

# Function for check selected WDI
function CheckSelectedWDI(){
	if ($RadioButtonROT.Checked -eq $true){
		OpenSelectedWDI $ComboBoxVersion.Text "ROT"
	}
	elseif ($RadioButtonMD.Checked -eq $true){
		OpenSelectedWDI $ComboBoxVersion.Text "MD"
	}
	elseif ($RadioButtonSI.Checked -eq $true){
		OpenSelectedWDI $ComboBoxVersion.Text "SI"
	}
	elseif ($RadioButtonAll.Checked -eq $true){
		OpenSelectedWDI $ComboBoxVersion.Text "ALL"
	}
	elseif ($RadioButtonClean.Checked -eq $true){
		OpenSelectedWDI $ComboBoxVersion.Text "CLEAN"
	}
}

# Function for open selected WDI
function OpenSelectedWDI($ExecutableSended, $TeamSended){
	if ($RadioButtonProfit.Checked -eq $true) {
		.\controller\ChecklistHelperWDIProfit.ps1 "$ExecutableSended" "$TeamSended"
	}
	elseif ($RadioButtonCrypto.Checked -eq $true) {
		.\controller\ChecklistHelperWDICrypto.ps1 "$ExecutableSended" "$TeamSended"
	}
	elseif ($RadioButtonRico.Checked -eq $true) {
		.\controller\ChecklistHelperWDIRico.ps1 "$ExecutableSended" "$TeamSended"
	}
	elseif ($RadioButtonGenial.Checked -eq $true) {
		.\controller\ChecklistHelperWDIGenial.ps1 "$ExecutableSended" "$TeamSended"
	}
}

# Function for filter WDI
function FilterWDI(){
	if ($RadioButtonProfit.Checked -eq $true) {
		$ComboBoxVersion.Items.Clear()
		InsertComboBoxValues "WatchDogInstrumentation_"
	}
	elseif ($RadioButtonCrypto.Checked -eq $true){
		$ComboBoxVersion.Items.Clear()
		InsertComboBoxValues "WatchDogInstrumentationCrypto_"
	}
	elseif ($RadioButtonRico.Checked -eq $true){
		$ComboBoxVersion.Items.Clear()
		InsertComboBoxValues "WatchDogInstrumentationRico_"
	}
	elseif ($RadioButtonGenial.Checked -eq $true){
		$ComboBoxVersion.Items.Clear()
		InsertComboBoxValues "WatchDogInstrumentationGenial_"
	}
}

##########################################################################################################################

#Button of action
$ButtonAction = New-Object System.Windows.Forms.Button
$ButtonAction.Location = New-Object System.Drawing.Size(20,360)
$ButtonAction.Size = New-Object System.Drawing.Size(550,30)
$ButtonAction.Text = "OPEN INSTRUMENTATION"
$ButtonAction.Font = $LabelBold
$ButtonAction.ForeColor = $SuccessColor
$ButtonAction.BackColor = $LabelColor
$MainForm.Controls.Add($ButtonAction)
$ButtonAction.Add_Click(
	{
		ActiveProgressBar
		CheckSelectedWDI
		$MainForm.Close()
	}
)


# Activate the groups
$RadioButtonGroupBoxTeams.Controls.AddRange(@($RadioButtonSI,$RadioButtonAll,$RadioButtonROT,$RadioButtonMD,$RadioButtonClean))
$MainForm.Controls.Add($RadioButtonGroupBoxTeams)
$RadioButtonGroupBoxExe.Controls.AddRange(@($RadioButtonProfit,$RadioButtonCrypto,$RadioButtonRico,$RadioButtonGenial,$ButtonChoice,$ComboBoxVersion,$LabelWarningLocalization,$LabelVersion))
$MainForm.Controls.Add($RadioButtonGroupBoxExe)

# Progressbar
$ProgressBarGeneral = New-Object system.Windows.Forms.ProgressBar
$ProgressBarGeneral.width = 550
$ProgressBarGeneral.height = 30
$ProgressBarGeneral.location = New-Object System.Drawing.Point(20,400)
$ProgressBarGeneral.Style = "Continuous"
$ProgressBarGeneral.Value = 0
$MainForm.Controls.Add($ProgressBarGeneral)

# Progressbar Label Information
$LabelInformationProgressBar = New-Object System.Windows.Forms.Label
$LabelInformationProgressBar.Text = ""
$LabelInformationProgressBar.AutoSize = $true
$LabelInformationProgressBar.ForeColor = $PrimaryColor
$LabelInformationProgressBar.Font = New-Object System.Drawing.Font("Calibri",12)
$LabelInformationProgressBar.location = New-Object System.Drawing.Point(20,430)
$MainForm.Controls.Add($LabelInformationProgressBar)

# Activate the form
InsertComboBoxValues "WatchDogInstrumentation_"
$MainForm.Add_Shown({$MainForm.Activate()})    
$MainForm.ShowDialog()