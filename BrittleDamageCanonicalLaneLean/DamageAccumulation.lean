import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BrittleDamageCanonicalLaneLean.BrittleDamageObject

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure DamageAccumulationPackage (O : BrittleDamageObject) where
  damageVariable : Type u
  loadingCycles : Prop
  damageEvolutionLaw : Prop
  cumulativeDamage : Prop
  failureCondition : Prop

structure DamageAccumulationEvidence (O : BrittleDamageObject) (D : DamageAccumulationPackage O) where
  loadingCyclesClosed : D.loadingCycles
  damageEvolutionLawClosed : D.damageEvolutionLaw
  cumulativeDamageClosed : D.cumulativeDamage
  failureConditionClosed : D.failureCondition

def DamageAccumulationClosed (O : BrittleDamageObject) (D : DamageAccumulationPackage O) : Prop :=
  D.loadingCycles ∧ D.damageEvolutionLaw ∧ D.cumulativeDamage ∧ D.failureCondition

theorem damage_accumulation_closed_from_evidence (O : BrittleDamageObject) (D : DamageAccumulationPackage O) (E : DamageAccumulationEvidence O D) :
    DamageAccumulationClosed O D := by
  exact And.intro E.loadingCyclesClosed
    (And.intro E.damageEvolutionLawClosed
      (And.intro E.cumulativeDamageClosed E.failureConditionClosed))

end BrittleDamageCanonicalLaneLean
end HautevilleHouse