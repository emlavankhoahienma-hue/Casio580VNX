import Foundation

// MARK: - 40 Scientific Constants (SHIFT + 7 CONST)
public struct ScientificConstant: Identifiable, Hashable {
    public let id: Int
    public let symbol: String
    public let nameVi: String
    public let nameEn: String
    public let value: Double
    public let unit: String
    public let category: String
}

public struct ConstantsData {
    public static let all: [ScientificConstant] = [
        // Universal (01 - 04)
        ScientificConstant(id: 1, symbol: "c", nameVi: "Vận tốc ánh sáng", nameEn: "Speed of light", value: 299792458, unit: "m/s", category: "Universal"),
        ScientificConstant(id: 2, symbol: "h", nameVi: "Hằng số Planck", nameEn: "Planck constant", value: 6.62607015e-34, unit: "J·s", category: "Universal"),
        ScientificConstant(id: 3, symbol: "ℏ", nameVi: "Hằng số Planck rút gọn", nameEn: "Reduced Planck const", value: 1.054571817e-34, unit: "J·s", category: "Universal"),
        ScientificConstant(id: 4, symbol: "μ₀", nameVi: "Độ từ thẩm chân không", nameEn: "Magnetic constant", value: 1.25663706212e-6, unit: "N/A²", category: "Universal"),
        
        // Electromagnetic (05 - 08)
        ScientificConstant(id: 5, symbol: "ε₀", nameVi: "Độ điện thẩm chân không", nameEn: "Electric constant", value: 8.8541878128e-12, unit: "F/m", category: "Electromagnetic"),
        ScientificConstant(id: 6, symbol: "G", nameVi: "Hằng số hấp dẫn", nameEn: "Gravitational constant", value: 6.67430e-11, unit: "m³/(kg·s²)", category: "Universal"),
        ScientificConstant(id: 7, symbol: "lₚ", nameVi: "Độ dài Planck", nameEn: "Planck length", value: 1.616255e-35, unit: "m", category: "Universal"),
        ScientificConstant(id: 8, symbol: "tₚ", nameVi: "Thời gian Planck", nameEn: "Planck time", value: 5.391247e-44, unit: "s", category: "Universal"),
        
        // Atomic & Nuclear (09 - 18)
        ScientificConstant(id: 9, symbol: "mₚ", nameVi: "Khối lượng proton", nameEn: "Proton mass", value: 1.67262192369e-27, unit: "kg", category: "Atomic & Nuclear"),
        ScientificConstant(id: 10, symbol: "mₙ", nameVi: "Khối lượng neutron", nameEn: "Neutron mass", value: 1.67492749804e-27, unit: "kg", category: "Atomic & Nuclear"),
        ScientificConstant(id: 11, symbol: "mₑ", nameVi: "Khối lượng electron", nameEn: "Electron mass", value: 9.1093837015e-31, unit: "kg", category: "Atomic & Nuclear"),
        ScientificConstant(id: 12, symbol: "m_μ", nameVi: "Khối lượng muon", nameEn: "Muon mass", value: 1.883531627e-28, unit: "kg", category: "Atomic & Nuclear"),
        ScientificConstant(id: 13, symbol: "a₀", nameVi: "Bán kính Bohr", nameEn: "Bohr radius", value: 5.29177210903e-11, unit: "m", category: "Atomic & Nuclear"),
        ScientificConstant(id: 14, symbol: "α", nameVi: "Hằng số cấu trúc mịn", nameEn: "Fine-structure const", value: 7.2973525693e-3, unit: "", category: "Atomic & Nuclear"),
        ScientificConstant(id: 15, symbol: "rₑ", nameVi: "Bán kính electron", nameEn: "Classical electron radius", value: 2.8179403262e-15, unit: "m", category: "Atomic & Nuclear"),
        ScientificConstant(id: 16, symbol: "λ_C", nameVi: "Bước sóng Compton", nameEn: "Compton wavelength", value: 2.42631023867e-12, unit: "m", category: "Atomic & Nuclear"),
        ScientificConstant(id: 17, symbol: "γₚ", nameVi: "Tỷ số từ hồi proton", nameEn: "Proton gyromagnetic", value: 2.6752218744e8, unit: "s⁻¹·T⁻¹", category: "Atomic & Nuclear"),
        ScientificConstant(id: 18, symbol: "λ_Cp", nameVi: "Bước sóng Compton proton", nameEn: "Proton Compton wave", value: 1.32140985539e-15, unit: "m", category: "Atomic & Nuclear"),
        
        // Physico-Chemical (19 - 28)
        ScientificConstant(id: 19, symbol: "R_∞", nameVi: "Hằng số Rydberg", nameEn: "Rydberg constant", value: 10973731.568160, unit: "m⁻¹", category: "Physico-Chemical"),
        ScientificConstant(id: 20, symbol: "μ_B", nameVi: "Bohr magneton", nameEn: "Bohr magneton", value: 9.2740100783e-24, unit: "J/T", category: "Physico-Chemical"),
        ScientificConstant(id: 21, symbol: "μ_N", nameVi: "Nuclear magneton", nameEn: "Nuclear magneton", value: 5.0507837461e-27, unit: "J/T", category: "Physico-Chemical"),
        ScientificConstant(id: 22, symbol: "μₑ", nameVi: "Từ momen electron", nameEn: "Electron magnetic moment", value: -9.2847647043e-24, unit: "J/T", category: "Physico-Chemical"),
        ScientificConstant(id: 23, symbol: "μₚ", nameVi: "Từ momen proton", nameEn: "Proton magnetic moment", value: 1.41060679736e-26, unit: "J/T", category: "Physico-Chemical"),
        ScientificConstant(id: 24, symbol: "μₙ", nameVi: "Từ momen neutron", nameEn: "Neutron magnetic moment", value: -9.6623651e-27, unit: "J/T", category: "Physico-Chemical"),
        ScientificConstant(id: 25, symbol: "μ_μ", nameVi: "Từ momen muon", nameEn: "Muon magnetic moment", value: -4.49044830e-26, unit: "J/T", category: "Physico-Chemical"),
        ScientificConstant(id: 26, symbol: "F", nameVi: "Hằng số Faraday", nameEn: "Faraday constant", value: 96485.33212, unit: "C/mol", category: "Physico-Chemical"),
        ScientificConstant(id: 27, symbol: "e", nameVi: "Điện tích nguyên tố", nameEn: "Elementary charge", value: 1.602176634e-19, unit: "C", category: "Physico-Chemical"),
        ScientificConstant(id: 28, symbol: "N_A", nameVi: "Hằng số Avogadro", nameEn: "Avogadro constant", value: 6.02214076e23, unit: "mol⁻¹", category: "Physico-Chemical"),
        
        // Adopted Values & Other (29 - 40)
        ScientificConstant(id: 29, symbol: "k", nameVi: "Hằng số Boltzmann", nameEn: "Boltzmann constant", value: 1.380649e-23, unit: "J/K", category: "Adopted"),
        ScientificConstant(id: 30, symbol: "V_m", nameVi: "Thể tích mol khí lý tưởng", nameEn: "Molar volume of ideal gas", value: 0.02271095464, unit: "m³/mol", category: "Adopted"),
        ScientificConstant(id: 31, symbol: "R", nameVi: "Hằng số khí lý tưởng", nameEn: "Molar gas constant", value: 8.314462618, unit: "J/(mol·K)", category: "Adopted"),
        ScientificConstant(id: 32, symbol: "c₁", nameVi: "Hằng số bức xạ thứ nhất", nameEn: "First radiation const", value: 3.741771852e-16, unit: "W·m²", category: "Adopted"),
        ScientificConstant(id: 33, symbol: "c₂", nameVi: "Hằng số bức xạ thứ hai", nameEn: "Second radiation const", value: 0.01438776877, unit: "m·K", category: "Adopted"),
        ScientificConstant(id: 34, symbol: "σ", nameVi: "Hằng số Stefan-Boltzmann", nameEn: "Stefan-Boltzmann const", value: 5.670374419e-8, unit: "W/(m²·K⁴)", category: "Adopted"),
        ScientificConstant(id: 35, symbol: "g", nameVi: "Gia tốc trọng trường chuẩn", nameEn: "Standard acceleration of gravity", value: 9.80665, unit: "m/s²", category: "Adopted"),
        ScientificConstant(id: 36, symbol: "atm", nameVi: "Khí quyển tiêu chuẩn", nameEn: "Standard atmosphere", value: 101325, unit: "Pa", category: "Adopted"),
        ScientificConstant(id: 37, symbol: "R_K", nameVi: "Hằng số von Klitzing", nameEn: "von Klitzing constant", value: 25812.80745, unit: "Ω", category: "Other"),
        ScientificConstant(id: 38, symbol: "G₀", nameVi: "Độ dẫn lượng tử", nameEn: "Conductance quantum", value: 7.748091729e-5, unit: "S", category: "Other"),
        ScientificConstant(id: 39, symbol: "t", nameVi: "Nhiệt độ Celsius", nameEn: "Celsius temperature", value: 273.15, unit: "K", category: "Other"),
        ScientificConstant(id: 40, symbol: "K_J", nameVi: "Hằng số Josephson", nameEn: "Josephson constant", value: 483597.8484e9, unit: "Hz/V", category: "Other")
    ]
}

// MARK: - 40 Unit Conversions (SHIFT + 8 CONV)
public struct UnitConversion: Identifiable, Hashable {
    public let id: Int
    public let title: String
    public let category: String
    public let convert: (Double) -> Double
}

public struct ConversionsData {
    public static let all: [UnitConversion] = [
        // Length (01 - 10)
        UnitConversion(id: 1, title: "in ➔ cm", category: "Length") { $0 * 2.54 },
        UnitConversion(id: 2, title: "cm ➔ in", category: "Length") { $0 / 2.54 },
        UnitConversion(id: 3, title: "ft ➔ m", category: "Length") { $0 * 0.3048 },
        UnitConversion(id: 4, title: "m ➔ ft", category: "Length") { $0 / 0.3048 },
        UnitConversion(id: 5, title: "yd ➔ m", category: "Length") { $0 * 0.9144 },
        UnitConversion(id: 6, title: "m ➔ yd", category: "Length") { $0 / 0.9144 },
        UnitConversion(id: 7, title: "mile ➔ km", category: "Length") { $0 * 1.609344 },
        UnitConversion(id: 8, title: "km ➔ mile", category: "Length") { $0 / 1.609344 },
        UnitConversion(id: 9, title: "n mile ➔ m", category: "Length") { $0 * 1852.0 },
        UnitConversion(id: 10, title: "m ➔ n mile", category: "Length") { $0 / 1852.0 },
        
        // Area & Volume (11 - 18)
        UnitConversion(id: 11, title: "acre ➔ m²", category: "Area") { $0 * 4046.8564224 },
        UnitConversion(id: 12, title: "m² ➔ acre", category: "Area") { $0 / 4046.8564224 },
        UnitConversion(id: 13, title: "gal (US) ➔ L", category: "Volume") { $0 * 3.785411784 },
        UnitConversion(id: 14, title: "L ➔ gal (US)", category: "Volume") { $0 / 3.785411784 },
        UnitConversion(id: 15, title: "gal (UK) ➔ L", category: "Volume") { $0 * 4.54609 },
        UnitConversion(id: 16, title: "L ➔ gal (UK)", category: "Volume") { $0 / 4.54609 },
        UnitConversion(id: 17, title: "pc ➔ km", category: "Length") { $0 * 3.085677581e13 },
        UnitConversion(id: 18, title: "km ➔ pc", category: "Length") { $0 / 3.085677581e13 },
        
        // Mass (19 - 24)
        UnitConversion(id: 19, title: "oz ➔ g", category: "Mass") { $0 * 28.349523125 },
        UnitConversion(id: 20, title: "g ➔ oz", category: "Mass") { $0 / 28.349523125 },
        UnitConversion(id: 21, title: "lb ➔ kg", category: "Mass") { $0 * 0.45359237 },
        UnitConversion(id: 22, title: "kg ➔ lb", category: "Mass") { $0 / 0.45359237 },
        UnitConversion(id: 23, title: "ton (US) ➔ kg", category: "Mass") { $0 * 907.18474 },
        UnitConversion(id: 24, title: "kg ➔ ton (US)", category: "Mass") { $0 / 907.18474 },
        
        // Pressure (25 - 30)
        UnitConversion(id: 25, title: "atm ➔ Pa", category: "Pressure") { $0 * 101325 },
        UnitConversion(id: 26, title: "Pa ➔ atm", category: "Pressure") { $0 / 101325 },
        UnitConversion(id: 27, title: "bar ➔ Pa", category: "Pressure") { $0 * 100000 },
        UnitConversion(id: 28, title: "Pa ➔ bar", category: "Pressure") { $0 / 100000 },
        UnitConversion(id: 29, title: "mmHg ➔ Pa", category: "Pressure") { $0 * 133.322387415 },
        UnitConversion(id: 30, title: "Pa ➔ mmHg", category: "Pressure") { $0 / 133.322387415 },
        
        // Energy & Power (31 - 36)
        UnitConversion(id: 31, title: "hp ➔ kW", category: "Power") { $0 * 0.74569987158227022 },
        UnitConversion(id: 32, title: "kW ➔ hp", category: "Power") { $0 / 0.74569987158227022 },
        UnitConversion(id: 33, title: "kgf/cm² ➔ Pa", category: "Pressure") { $0 * 98066.5 },
        UnitConversion(id: 34, title: "Pa ➔ kgf/cm²", category: "Pressure") { $0 / 98066.5 },
        UnitConversion(id: 35, title: "J ➔ cal", category: "Energy") { $0 / 4.184 },
        UnitConversion(id: 36, title: "cal ➔ J", category: "Energy") { $0 * 4.184 },
        
        // Temperature (37 - 40)
        UnitConversion(id: 37, title: "°F ➔ °C", category: "Temperature") { ($0 - 32.0) * 5.0 / 9.0 },
        UnitConversion(id: 38, title: "°C ➔ °F", category: "Temperature") { $0 * 9.0 / 5.0 + 32.0 },
        UnitConversion(id: 39, title: "J ➔ Btu", category: "Energy") { $0 / 1055.056 },
        UnitConversion(id: 40, title: "Btu ➔ J", category: "Energy") { $0 * 1055.056 }
    ]
}
