import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure FractureToughnessPackage where
  criticalStressIntensity : Type u
  fractureEnergy : Type v
  modeI : Prop
  modeII : Prop
  mixedMode : Prop

structure FractureToughnessEvidence (F : FractureToughnessPackage) where
  modeIClosed : F.modeI
  modeIIClosed : F.modeII
  mixedModeClosed : F.mixedMode

def FractureToughnessClosed (F : FractureToughnessPackage) : Prop :=
  F.modeI ∧ F.modeII ∧ F.mixedMode

theorem fracture_toughness_closed_from_evidence (F : FractureToughnessPackage)
    (E : FractureToughnessEvidence F) : FractureToughnessClosed F := by
  exact And.intro E.modeIClosed
    (And.intro E.modeIIClosed E.mixedModeClosed)

end BrittleDamageCanonicalLaneLean
end HautevilleHouse