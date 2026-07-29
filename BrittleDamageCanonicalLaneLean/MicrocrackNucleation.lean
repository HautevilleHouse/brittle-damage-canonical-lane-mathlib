import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure MicrocrackNucleationPackage where
  nucleationSite : Type u
  criticalStress : Type v
  inclusionTrigger : Prop
  voidGrowth : Prop
  coalescenceCriterion : Prop

structure MicrocrackNucleationEvidence (M : MicrocrackNucleationPackage) where
  inclusionTriggerClosed : M.inclusionTrigger
  voidGrowthClosed : M.voidGrowth
  coalescenceCriterionClosed : M.coalescenceCriterion

def MicrocrackNucleationClosed (M : MicrocrackNucleationPackage) : Prop :=
  M.inclusionTrigger ∧ M.voidGrowth ∧ M.coalescenceCriterion

theorem microcrack_nucleation_closed_from_evidence (M : MicrocrackNucleationPackage)
    (E : MicrocrackNucleationEvidence M) : MicrocrackNucleationClosed M := by
  exact And.intro E.inclusionTriggerClosed
    (And.intro E.voidGrowthClosed E.coalescenceCriterionClosed)

end BrittleDamageCanonicalLaneLean
end HautevilleHouse