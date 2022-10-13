SELECT * FROM portfolio.coviddeaths;

USE portfolio;
Create View PercentPopulationVaccinated as 
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(convert(vac.new_vaccinations, unsigned)) over (partition by dea.location Order by dea.location,
dea.Date) as RollingPeopleVaccinated
From Portfolio.coviddeaths dea
Join Portfolio.covidvaccinations vac
	On dea.location = vac.location
    and dea.date = vac.date
where dea.continent is not null
-- order by 2, 3

