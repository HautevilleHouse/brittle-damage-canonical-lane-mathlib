import HautevilleHouse.BrittleDamageCanonicalLaneLean.EnergyReleaseRate

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure EvolutionPackage where
  damageVariable : Type
  drivingForce : Type
  kineticLaw : Prop
  irreversibility : Prop
  thresholdCondition : Prop

structure EvolutionEvidence (E : EvolutionPackage) where
  damageVariableClosed : E.damageVariable = E.damageVariable
  drivingForceClosed : E.drivingForce = E.drivingForce
  kineticLawClosed : E.kineticLaw
  irreversibilityClosed : E.irreversibility
  thresholdConditionClosed : E.thresholdCondition

def EvolutionClosed (E : EvolutionPackage) : Prop :=
  E.kineticLaw ∧ E.irreversibility ∧ E.thresholdCondition

theorem evolution_closed_from_evidence (E : EvolutionPackage)
    (Ev : EvolutionEvidence E) : EvolutionClosed E := by
  exact And.intro Ev.kineticLawClosed (And.intro Ev.irreversibilityClosed Ev.thresholdConditionClosed)

end BrittleDamageCanonicalLaneLean
end HautevilleHouse