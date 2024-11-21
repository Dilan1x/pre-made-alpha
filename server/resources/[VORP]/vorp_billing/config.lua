Billing = {}
Billing.Lang = "English"                         -- language you want to use please make sure its in the translation.lua

Billing.GiveMoneyToJob = true       -- if false the money wont be given to anyone if true the money will be given to the person who is billing

Billing.AllowBillingNegative = true -- if true it will alow to bill player to negative money, if true you cant bill players that dont have money

Billing.GiveReceipt = true          -- if true the player who got billed will receive a receipt as item

Billing.ReceiptItem = "receipt"     -- the item that will be given to the player who paid the bill, add this item to the database

Billing.ServerYear = 1899           -- the year that will be used in the receipt description

-- jobs allowed to use billing and ranks
Billing.Jobs = {
    ValSheriff = 0, -- job and grade allowed anything above the grade you add will have permission if grade is 1 then grade 0 will not have permission but grade 1 and above will
    BwPolice = 0,
    SdPolice = 0,
    RhoSheriff = 0,
    ArmSheriff = 0,
    Doctor = 0,
    Shaman = 0,
}

-- the command that will be used to bill players
Billing.Command = "bill"

Billing.MaxBillAmount = 1000 -- players can not be billed more than this amount

--server side function to check if player is onduty
local isServer = IsDuplicityVersion()
if isServer then
    Billing.GetIsOnduty = function(source)
        -- add here your own logic for other jobs
        -- by default these will work for vorp_medic and vorp_police
        local isDuty = (Player(source).state.isMedicDuty or Player(source).state.isPoliceDuty) and true or false
        return isDuty -- do return true to remove the onduty check
    end
end
