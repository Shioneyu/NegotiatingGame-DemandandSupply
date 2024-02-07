shader_type spatial;

void fragment() {
    // 创建一个基于时间的周期性变化的因子
    float timeFactor = abs(sin(TIME)); // 时间因子在0到1之间周期性变化

    // 设置基本颜色
    vec3 baseColor = vec3(1, 1.0, 0.0); // 黄色

    // 应用时间因子到颜色上，使其亮度随时间变化
    ALBEDO = baseColor * timeFactor;
}



