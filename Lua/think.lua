local enemySonarCooldown = 5 * 60
local updateAfflictionCooldown = 2 * 60

Hook.Add("think", "think", function()
    if Game.Paused or not Game.RoundStarted then return end

    if RealSonar.EnemySub then
        if enemySonarCooldown <= 0 then
            if RealSonar.Config.EnemySonar and not RealSonar.EnemySub.captain.IsOnPlayerTeam then
                enemySonarCooldown = RealSonar.updateEnemySonarMode() * 60
            else
                enemySonarCooldown = 5 * 60 -- Check again in 5 seconds.
            end
        end
        enemySonarCooldown = enemySonarCooldown - 1
    end

    if updateAfflictionCooldown <= 0 then
        updateAfflictionCooldown = RealSonar.updateAfflictions() * 60
    end
    updateAfflictionCooldown = updateAfflictionCooldown - 1
end)