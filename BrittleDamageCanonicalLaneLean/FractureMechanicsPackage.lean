import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure FractureMechanicsPackage where
  stressField : Type u
  crackGeometry : Type v
  stressIntensityFactor : Prop
  crackGrowthCriterion : Prop
  fractureToughness : Prop
  loadHistory : Prop

structure FractureMechanicsEvidence (F : FractureMechanicsPackage) where
  stressIntensityFactorClosed : F.stressIntensityFactor
  crackGrowthCriterionClosed : F.crackGrowthCriterion
  fractureToughnessClosed : F.fractureToughness
  loadHistoryClosed : F.loadHistory

def FractureMechanicsClosed (F : FractureMechanicsPackage) : Prop :=
  F.stressIntensityFactor ∧ F.crackGrowthCriterion ∧ F.fractureToughness ∧ F.loadHistory

theorem fracture_mechanics_closed_from_evidence (F : FractureMechanicsPackage) (E : FractureMechanicsEvidence F) :
    FractureMechanicsClosed F := by
  exact And.intro E.stressIntensityFactorClosed
    (And.intro E.crackGrowthCriterionClosed
      (And.intro E.fractureToughnessClosed E.loadHistoryClosed))

end BrittleDamageCanonicalLaneLean
end HautevilleHouse