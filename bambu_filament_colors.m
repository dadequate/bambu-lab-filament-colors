#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

static NSColor *ColorFromHex(NSString *hex) {
    NSString *h = [hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([h hasPrefix:@"#"]) { h = [h substringFromIndex:1]; }
    if (h.length != 6) { return [NSColor blackColor]; }
    unsigned int rgb = 0;
    [[NSScanner scannerWithString:h] scanHexInt:&rgb];
    CGFloat r = ((rgb >> 16) & 0xFF) / 255.0;
    CGFloat g = ((rgb >> 8) & 0xFF) / 255.0;
    CGFloat b = (rgb & 0xFF) / 255.0;
    return [NSColor colorWithDeviceRed:r green:g blue:b alpha:1.0];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *paletteName = @"Bambu Lab Filament Colors";
        NSColorList *list = [[NSColorList alloc] initWithName:paletteName];

        NSDictionary<NSString*, NSString*> *colors = @{
            @"PLA Basic — Jade White": @"#FFFFFF",
            @"PLA Basic — Black": @"#000000",
            @"PLA Basic — Red": @"#C12E1F",
            @"PLA Basic — Blue": @"#0A2989",
            @"PLA Basic — Gray": @"#8E9089",
            @"PLA Basic — Bambu Green": @"#00AE42",
            @"PLA Basic — Mistletoe Green": @"#3F8E43",
            @"PLA Basic — Cyan": @"#0086D6",
            @"PLA Basic — Sunflower Yellow": @"#FEC600",
            @"PLA Basic — Indigo Purple": @"#482960",
            @"PLA Basic — Cocoa Brown": @"#6F5034",
            @"PLA Basic — Hot Pink": @"#F5547C",
            @"PLA Basic — Pumpkin Orange": @"#FF9016",
            @"PLA Matte — Ivory White": @"#FFFFFF",
            @"PLA Matte — Bone White": @"#CBC6B8",
            @"PLA Matte — Desert Tan": @"#E8DBB7",
            @"PLA Matte — Latte Brown": @"#D3B7A7",
            @"PLA Matte — Caramel": @"#AE835B",
            @"PLA Matte — Terracotta": @"#B15533",
            @"PLA Matte — Dark Brown": @"#7D6556",
            @"PLA Matte — Dark Chocolate": @"#4D3324",
            @"PLA Matte — Lilac Purple": @"#AE96D4",
            @"PLA Matte — Sakura Pink": @"#E8AFCF",
            @"PLA Matte — Mandarin Orange": @"#F99963",
            @"PLA Matte — Lemon Yellow": @"#F7D959",
            @"PLA Matte — Plum": @"#950051",
            @"PLA Matte — Scarlet Red": @"#DE4343",
            @"PLA Matte — Dark Red": @"#BB3D43",
            @"PLA Matte — Dark Green": @"#68724D",
            @"PLA Matte — Grass Green": @"#61C680",
            @"PLA Matte — Apple Green": @"#C2E189",
            @"PLA Matte — Ash Gray": @"#9B9EA0",
            @"PLA Matte — Marine Blue": @"#0078BF",
            @"PLA Matte — Charcoal": @"#000000",
            @"PLA Tough+ — White": @"#FFFFFF",
            @"PLA Tough+ — Gray": @"#AFB1AE",
            @"PLA Tough+ — Black": @"#000000",
            @"PLA Tough+ — Silver": @"#959698",
            @"PLA Tough+ — Yellow": @"#F4D53F",
            @"PLA Tough+ — Cyan": @"#009BD8",
            @"PLA Tough+ — Orange": @"#DC3A27",
            @"PLA Translucent — Teal": @"#009FA1",
            @"PLA Translucent — Light Jade": @"#96D8AF",
            @"PLA Translucent — Blue": @"#0047BB",
            @"PLA Translucent — Mellow Yellow": @"#F5DBAB",
            @"PLA Translucent — Purple": @"#8344B0",
            @"PLA Translucent — Cherry Pink": @"#F5B6CD",
            @"PLA Translucent — Orange": @"#F74E02",
            @"PLA Translucent — Ice Blue": @"#B8CDE9",
            @"PLA Translucent — Red": @"#B50011",
            @"PLA Translucent — Lavender": @"#B8ACD6",
            @"PLA-CF — Burgundy Red": @"#951E23",
            @"PLA-CF — Iris Purple": @"#69398E",
            @"PLA-CF — Matcha Green": @"#5C9748",
            @"PLA-CF — Jeans Blue": @"#6E88BC",
            @"PLA-CF — Royal Blue": @"#2842AD",
            @"PLA-CF — Lava Gray": @"#4D5054",
            @"PLA-CF — Black": @"#000000",
            @"PETG-CF — Brick Red": @"#9F332A",
            @"PETG-CF — Violet Purple": @"#583061",
            @"PETG-CF — Indigo Blue": @"#324585",
            @"PETG-CF — Malachite Green": @"#16B08E",
            @"PETG-CF — Black": @"#000000",
            @"PETG-CF — Titan Gray": @"#565656",
            @"ABS — White": @"#FFFFFF",
            @"ABS — Desert Tan": @"#E8DBB7",
            @"ABS — Olive": @"#789D4A",
            @"ABS — Azure": @"#489FDF",
            @"ABS — Navy Blue": @"#0C2340",
            @"ABS — Blue": @"#0A2CA5",
            @"ABS — Tangerine Yellow": @"#FFC72C",
            @"ABS — Orange": @"#FF6A13",
            @"ABS — Red": @"#D32941",
            @"ABS — Purple": @"#AF1685",
            @"ABS — Silver": @"#87909A",
            @"ABS — Black": @"#000000",
            @"ABS — Bambu Green": @"#00AE42",
            @"TPU 90A — Black": @"#000000",
            @"TPU 90A — White": @"#FFFFEE",
            @"TPU 90A — Grape Jelly": @"#D6ABFF",
            @"TPU 90A — Crystal Blue": @"#7EB4E1",
            @"TPU 90A — Cocoa Brown": @"#5C4738",
            @"TPU 90A — Quicksilver": @"#9EA2A2",
            @"TPU 90A — Blaze (Light)": @"#F1AAA8",
            @"TPU 90A — Blaze (Dark)": @"#D21B3C",
            @"TPU 90A — Frozen (Light)": @"#FFFFFF",
            @"TPU 90A — Frozen (Blue)": @"#40B6E4",
            @"PLA Silk Multi-Color — Mystic Magenta (Purple)": @"#720062",
            @"PLA Silk Multi-Color — Mystic Magenta (Green)": @"#3A913F",
            @"PLA Silk Multi-Color — Phantom Blue (Blue)": @"#00629B",
            @"PLA Silk Multi-Color — Phantom Blue (Black)": @"#000000",
            @"PLA Wood — Black Walnut": @"#4F3F24",
            @"PLA Wood — Rosewood": @"#4C241C",
            @"PLA Wood — Clay Brown": @"#995F11",
            @"PLA Wood — Classic Birch": @"#918669",
            @"PLA Wood — White Oak": @"#D6CCA3",
            @"PLA Wood — Ochre Yellow": @"#C98935",
        };

        [colors enumerateKeysAndObjectsUsingBlock:^(NSString *name, NSString *hex, BOOL *stop) {
            [list setColor:ColorFromHex(hex) forKey:name];
        }];

        // Write into ~/Library/Colors/ (system color palettes)
        NSError *err = nil;
        NSURL *colorsDir = [[[NSFileManager defaultManager] URLForDirectory:NSLibraryDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:false error:&err] URLByAppendingPathComponent:@"Colors" isDirectory:YES];
        if (!colorsDir) { NSLog(@"❌ Could not locate ~/Library. %@", err); return 1; }
        NSURL *outURL = [colorsDir URLByAppendingPathComponent:[paletteName stringByAppendingString:@".clr"]];
        BOOL ok = [list writeToURL:outURL error:&err];
        if (!ok) { NSLog(@"❌ Failed to write palette. %@", err); return 1; }
        NSLog(@"✅ Saved %@ (%lu colors) to %@", paletteName, (unsigned long)colors.count, outURL.path);
    }
    return 0;
}
