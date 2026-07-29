import BrittleDamageCanonicalLaneLean.DamageEvolution

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure StressFieldPackage where
  stressTensor : Type
  strainTensor : Type
  elasticModulus : Prop
  linearElasticLaw : Prop

structure StressFieldEvidence (G : StressFieldPackage) where
  elasticModulusClosed : G.elasticModulus
  linearElasticLawClosed : G.linearElasticLaw

def StressFieldClosed (G : StressFieldPackage) : Prop :=
  G.elasticModulus ∧ G.linearElasticLaw

theorem stress_field_closed_from_evidence (G : StressFieldPackage) (E : StressFieldEvidence G) :
    StressFieldClosed G := by
  exact And.intro E.elasticModulusClosed E.linearElasticLawClosed

structure StressStrainFieldPackage (G : StressFieldPackage) where
  equilibriumEquation : Prop
  compatibilityCondition : Prop
  boundaryConditions : Prop

structure StressStrainFieldEvidence {G : StressFieldPackage} (S : StressStrainFieldPackage G) where
  equilibriumEquationClosed : S.equilibriumEquation
  compatibilityConditionClosed : S.compatibilityCondition
  boundaryConditionsClosed : S.boundaryConditions

def StressStrainFieldClosed {G : StressFieldPackage} (S : StressStrainFieldPackage G) : Prop :=
  S.equilibriumEquation ∧ S.compatibilityCondition ∧ S.boundaryConditions

theorem stress_strain_field_closed_from_evidence
    {G : StressFieldPackage} (S : StressStrainFieldPackage G) (E : StressStrainFieldEvidence S) :
    StressStrainFieldClosed S := by
  exact And.intro E.equilibriumEquationClosed
    (And.intro E.compatibilityConditionClosed E.boundaryConditionsClosed)

end BrittleDamageCanonicalLaneLean
end HautevilleHouse